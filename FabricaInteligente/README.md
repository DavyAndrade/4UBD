# Fábrica Inteligente Sustentável

## Exercício Integrador – Ciência de Dados com Python

Este exercício integra as principais bibliotecas estudadas (NumPy, Pandas, Matplotlib, Seaborn,
Scikit-learn e TensorFlow) em um contexto prático do setor industrial e energético. O objetivo é
criar um protótipo de sistema especialista de apoio à decisão para otimizar o consumo de energia
elétrica com base nos dados de produção de uma fábrica.

## 1. Manipulação de Dados (Pandas + NumPy)

- Ler o arquivo `fabrica_energia.csv`. - Calcular média, desvio padrão e total de energia consumida
  por máquina. - Identificar o dia com maior e menor produção.

## 2. Visualização (Matplotlib + Seaborn)

- Criar um gráfico de dispersão (horas trabalhadas × consumo energético). - Criar um gráfico de
  linha (consumo energético ao longo dos dias).

## 3. Classificação (Scikit-learn)

- Adicionar coluna `alto_consumo` (1 se consumo_kwh > média). - Treinar modelo
  DecisionTreeClassifier com entradas `horas_trabalhadas` e `unidades_produzidas`.

## 4. Predição (TensorFlow)

- Criar uma rede neural simples para prever `consumo_kwh` com base nas variáveis de produção.
- Usar duas camadas ocultas e ativação ReLU.
