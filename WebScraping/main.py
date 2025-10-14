# Importação das bibliotecas
import requests
from bs4 import BeautifulSoup
import warnings

# Tenta usar o bundle de certificados do certifi, se estiver instalado no venv
try:
    import certifi
    ca_bundle = certifi.where()
except Exception:
    ca_bundle = None

# Endereço da página a ser acessada
url = "https://portal.stf.jus.br/jurisprudencia/aplicacaosumula.asp"


def fetch(url: str) -> requests.Response:
    """Tenta buscar a URL usando o bundle de certificados se disponível.

    Em caso de erro de verificação SSL, tenta novamente sem verificação
    (inseguro) e avisa o usuário.
    """
    # Cabeçalhos para simular um navegador real (evita alguns 403)
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36",
        "Accept-Language": "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,"
                  "image/webp,image/apng,*/*;q=0.8",
    }

    try:
        if ca_bundle:
            resp = requests.get(url, headers=headers, verify=ca_bundle, timeout=10)
        else:
            resp = requests.get(url, headers=headers, timeout=10)
        resp.raise_for_status()
        return resp
    except requests.exceptions.SSLError as e:
        print("Aviso: erro de verificação SSL:", e)
        print("Tentando novamente sem verificação de certificado (inseguro)...")
        # Suprime o warning de inseguro apenas para esta tentativa
        try:
            from urllib3.exceptions import InsecureRequestWarning
            warnings.filterwarnings("ignore", InsecureRequestWarning)
        except Exception:
            pass
        resp = requests.get(url, headers=headers, verify=False, timeout=10)
        resp.raise_for_status()
        return resp



def main() -> None:
    try:
        response = fetch(url)
    except Exception as e:
        print("Erro ao acessar a página:", e)
        return

    soup = BeautifulSoup(response.text, "html.parser")
    titulo = soup.title
    print("Título da página:", titulo.text if titulo else "(sem título)")


if __name__ == "__main__":
    main()
