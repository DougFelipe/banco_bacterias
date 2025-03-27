# Relatório do Projeto de Sistemas de Banco de Dados

**Curso:** [Banco de Dados - DIM0125]  
**Professor:** [MARCEL VINICIUS MEDEIROS OLIVEIRA]  


**Aluno:** [Douglas Felipe de Lima Silva]  
**Matrícula:** 20220054131  

**Aluno:** [Nome do Aluno]  
**Matrícula:** XXXXXXXX  

**Aluno:** [Nome do Aluno]  
**Matrícula:** XXXXXXXX  



---

## Sumário

1. [Concepção e Definição dos Projetos](#1-concepção-e-definição-dos-projetos)
2. [Descrição da Entrega Inicial do Projeto](#2-descrição-da-entrega-inicial-do-projeto)  
   2.1 [Descrição da Visão do Produto](#21-descrição-da-visão-do-produto)  
   2.2 [Descrição dos Atores Envolvidos e dos Usuários Finais](#22-descrição-dos-atores-envolvidos-e-dos-usuários-finais)  
   2.3 [Descrição do Ambiente do Usuário](#23-descrição-do-ambiente-do-usuário)  
   2.4 [Principais Necessidades dos Usuários e Envolvidos](#24-principais-necessidades-dos-usuários-e-envolvidos)  
   2.5 [Alternativas e Concorrência](#25-alternativas-e-concorrência)  
   2.6 [Visão Geral do Produto](#26-visão-geral-do-produto)  
   2.7 [Recursos do Produto](#27-recursos-do-produto)  
   2.8 [Outros Requisitos do Sistema](#28-outros-requisitos-do-sistema)  
   2.9 [Cronograma do Projeto](#29-cronograma-do-projeto)
3. [Descrição da Entrega Final do Projeto](#3-descrição-da-entrega-final-do-projeto)

---

## 1. Concepção e Definição dos Projetos

Este projeto tem como principal objetivo promover a aplicação prática dos conhecimentos adquiridos em modelagem e desenvolvimento de sistemas de banco de dados, a partir de um conjunto de dados reais provenientes de um experimento microbiológico. A base de dados utilizada contempla diferentes amostras isoladas, seus atributos morfológicos, genéticos e funcionais, bem como o registro de ensaios bioquímicos e ambientais. O cenário proposto oferece uma oportunidade concreta de lidar com dados complexos e heterogêneos, que demandam organização estruturada, normalização e tratamento semântico para garantir a integridade, escalabilidade e facilidade de consulta posterior.


### Diagnóstico da Situação Atual (as-is)

Atualmente, os dados estão armazenados em planilhas independentes, com estruturas não normalizadas, campos sobrepostos, nomenclaturas variadas e ausência de chaves relacionais. Essa abordagem manual, apesar de funcional em pequena escala, dificulta:

- A manutenção e atualização consistente das informações;
- A realização de análises comparativas e agregadas;
- O versionamento e o controle histórico dos dados;
- A integração com ferramentas de análise estatística ou plataformas web.

### Proposta de Situação Futura (to-be)

O projeto propõe a modelagem e implementação de um sistema de banco de dados relacional, centrado em entidades como: `Amostra`, `Isolado`, `Consórcio`, `TesteFuncional`, `Sequenciamento`, `Morfologia`, `EnsaioGenômico`, entre outras. A nova estrutura:

- Assegura integridade referencial entre os dados;
- Facilita consultas específicas e cruzamentos complexos;
- Permite o crescimento futuro da base com dados adicionais;
- Suporta análises automatizadas e construção de dashboards.

---

## 2. Descrição da Entrega Inicial do Projeto

### 2.1 Descrição da Visão do Produto

Descrever os objetivos do projeto, indicando o propósito, principais benefícios e a motivação para sua realização. Detalhar:
- Necessidades
- Estado atual
- Melhorias esperadas
- Modelagem de Processo de Negócio (usando notação BPM)

### 2.2 Descrição dos Atores Envolvidos e dos Usuários Finais

**Envolvidos (não usuários finais):**
- Nome:
- Descrição:
- Responsabilidade:

**Usuários Finais:**
- Nome:
- Descrição:
- Responsabilidade:
- Envolvido representante:

### 2.3 Descrição do Ambiente do Usuário

- Número de pessoas envolvidas nas tarefas
- Duração do ciclo de tarefas
- Restrições existentes
- Plataformas utilizadas atualmente e futuras
- Integração com outros aplicativos existentes

### 2.4 Principais Necessidades dos Usuários e Envolvidos

Para cada problema identificado:
- Quais são as causas?
- Como está sendo resolvido agora?
- Qual a solução desejada?

E para cada necessidade:
- Prioridade
- Preocupações
- Solução Atual
- Solução Proposta

### 2.5 Alternativas e Concorrência

Listar as opções disponíveis:
- Produtos concorrentes
- Soluções locais
- Manutenção do status quo

Analisar pontos fortes e fracos de cada alternativa conforme a visão dos envolvidos.

### 2.6 Visão Geral do Produto

**Perspectiva do Produto:**
- Independência ou integração com outros sistemas
- Diagrama de blocos (se aplicável)

**Suposições e Dependências:**
- Fatores que podem alterar os requisitos
- Exemplo: disponibilidade de sistema operacional ou infraestrutura

### 2.7 Recursos do Produto

Listar funcionalidades (requisitos funcionais):
- Descrição geral das funcionalidades
- Prioridade, estabilidade, esforço, risco
- Questões de usabilidade

### 2.8 Outros Requisitos do Sistema

Listar requisitos não funcionais:
- Padrões aplicáveis
- Hardware/plataforma
- Desempenho
- Tolerância a erros
- Usabilidade
- Documentação
- Restrições externas

### 2.9 Cronograma do Projeto

- Estrutura Analítica do Projeto (EAP)
- Entregáveis intermediários
- Previsão de conclusão

Incluir lista de documentos mencionados com:
- Título
- Número (se houver)
- Data
- Organização

---

## 3. Descrição da Entrega Final do Projeto

Ao final do semestre, os grupos devem apresentar:

- Documento de Visão de Produto
- Modelo Entidade-Relacionamento (ER)
- Modelo Relacional
- Normalização
- Código-fonte do sistema implementado

> Entregas intermediárias ocorrerão conforme cronograma definido pelo professor.

---

