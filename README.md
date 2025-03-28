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

O objetivo deste projeto é desenvolver um sistema de banco de dados relacional voltado para a organização e gerenciamento de dados microbiológicos experimentais, com foco em amostras isoladas, consórcios microbianos, características genômicas e resultados de ensaios laboratoriais.

O sistema proposto busca atender às necessidades específicas de pesquisadores e profissionais da área de biotecnologia e microbiologia ambiental, fornecendo uma plataforma confiável para armazenar, consultar e interpretar grandes volumes de dados complexos.

#### 🔍 Necessidades

Atualmente, os dados são mantidos em múltiplas planilhas Excel, muitas vezes com informações duplicadas, inconsistências de nomenclatura, falta de integridade entre registros e ausência de estrutura relacional. Isso gera dificuldades como:

- Baixa rastreabilidade dos resultados experimentais;
- Dificuldade de cruzamento entre diferentes dimensões de dados (ex: morfologia × desempenho funcional);
- Risco elevado de perda ou corrupção dos dados;
- Baixa escalabilidade para inserção de novas amostras e testes.

####  Estado Atual

- Os dados estão dispersos em **9 planilhas distintas**, sem integração lógica;
- Muitas planilhas possuem colunas genéricas ou mal nomeadas;
- A ausência de chaves primárias e estrangeiras impossibilita validação automática;
- Não há versionamento, controle de histórico ou padronização dos formatos.

####  Melhorias Esperadas

- Implementação de um **modelo relacional estruturado**, com entidades bem definidas (ex: `Amostra`, `Isolado`, `TesteFuncional`);
- Garantia de **integridade referencial** entre dados experimentais, genômicos e descritivos;
- Facilidade de manutenção, busca e análise dos dados;
- Redução de erros humanos por meio de validações e padronizações no sistema.

####  Modelagem de Processo de Negócio (BPM)

Para estruturar o fluxo do sistema e entender melhor as interações com os dados, será elaborada uma **Modelagem de Processo de Negócio (BPM)** representando:

- O processo de cadastro e curadoria de novas amostras;
- A associação de dados experimentais aos isolados;
- A submissão de dados genômicos e metadados;
- A emissão de relatórios e visualizações analíticas para o time de pesquisa.

A notação BPMN será utilizada para representar visualmente os processos, com o auxílio da ferramenta **PlantUML**, a fim de facilitar a comunicação entre os envolvidos e garantir um entendimento compartilhado dos fluxos de trabalho.



### 2.2 Descrição dos Atores Envolvidos e dos Usuários Finais

Nesta seção são apresentados os principais envolvidos no projeto, incluindo tanto os **usuários finais** que utilizarão o sistema diretamente, quanto os **envolvidos** que influenciam nos requisitos, mas não necessariamente interagem com o sistema. Essa identificação é essencial para garantir que todas as necessidades sejam compreendidas e contempladas na modelagem do banco de dados.

---

#### 👥 Envolvidos (não usuários finais)

| Nome            | Descrição                                                                 | Responsabilidade                                                              |
|-----------------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Coordenador de Pesquisa | Responsável pela supervisão geral das atividades do laboratório.           | Aprovar diretrizes para padronização dos dados e garantir integridade científica. |
| Professores Orientadores | Docentes que orientam os projetos de pesquisa.                        | Validar a modelagem dos dados e propor melhorias com base em objetivos didáticos. |
| Equipe de TI Acadêmica | Suporte técnico da instituição.                                       | Apoiar a infraestrutura de hospedagem e manutenção do sistema de banco de dados. |

---

#### 👤 Usuários Finais

| Nome             | Descrição                                                              | Responsabilidade                                                      | Envolvido Representante          |
|------------------|------------------------------------------------------------------------|------------------------------------------------------------------------|----------------------------------|
| Pesquisadores    | Mestres/doutorandos que coletam e analisam dados microbiológicos.      | Inserir novos registros de amostras, consultar resultados e exportar dados. | Coordenador de Pesquisa         |
| Estudantes de Iniciação Científica | Alunos de graduação envolvidos nos projetos de pesquisa.               | Auxiliar no preenchimento dos dados e revisão de informações históricas. | Professores Orientadores        |

---

Essa estrutura colaborativa reforça a necessidade de um sistema intuitivo, validado por diferentes perfis de usuário, e com controle de acesso adequado às funções de cada papel no processo.



### 2.3 Descrição do Ambiente do Usuário

O sistema será utilizado em um ambiente acadêmico de pesquisa aplicada, especificamente em um laboratório de microbiologia que conduz estudos com bactérias isoladas de ambientes contaminados, visando aplicações biotecnológicas e ambientais.

####  Número de Pessoas Envolvidas nas Tarefas

Atualmente, participam ativamente das atividades envolvidas nesse projeto:

- 1 professora coordenadora do laboratório;
- Alunos de Iniciação Científica (IC);
- Mestrandos e doutorandos vinculados ao programa de pós-graduação.

No total, estima-se que entre **6 a 10 pessoas** estejam envolvidas diretamente nas atividades que envolvem coleta, experimentação, análise e cadastro de dados no sistema.

####  Duração do Ciclo de Tarefas

As tarefas relacionadas à geração de dados seguem um fluxo recorrente:

- **Coleta e isolamento das amostras:** pode levar de **4 a 5 semanas** por ciclo;
- **Realização dos testes laboratoriais:** entre **1 a 4 semanas**, dependendo do experimento;
- **Análise de dados e inserção no sistema:** geralmente feita semanalmente ou ao fim de cada ensaio.

O ciclo completo, da coleta até o registro final no sistema, pode durar entre **3 a 6 semanas**, com sobreposição entre atividades de diferentes amostras.

####  Restrições Existentes

O ambiente de pesquisa do laboratório apresenta desafios típicos de centros acadêmicos que lidam com grandes volumes de dados experimentais de forma descentralizada. A ausência de um sistema centralizado tem gerado limitações significativas para a gestão e evolução dos dados microbiológicos.

Entre as principais restrições observadas, destacam-se:

- **Fragmentação da informação:** Os dados estão distribuídos entre diferentes arquivos, versões e dispositivos, dificultando o acesso e a consistência das informações;
- **Baixa rastreabilidade científica:** Não há mecanismos eficientes para acompanhar o histórico de modificações ou identificar a autoria das edições nos registros experimentais;
- **Dependência de conhecimento informal:** A estrutura e os critérios de preenchimento das planilhas são, muitas vezes, compreendidos apenas por quem criou ou manuseia os arquivos, o que compromete a continuidade em caso de troca de bolsistas ou pesquisadores;
- **Limitações operacionais:** A inserção, recuperação e cruzamento de dados exigem esforço manual elevado, o que consome tempo dos pesquisadores e aumenta a probabilidade de erros;
- **Ausência de mecanismos de validação:** Os dados não passam por nenhum tipo de verificação automatizada, o que permite inconsistências sem alerta ou correção.

Essas restrições reforçam a importância da implementação de um sistema que não apenas organize os dados de forma relacional, mas também ofereça suporte à colaboração segura e à preservação do conhecimento gerado no laboratório ao longo do tempo.



####  Plataformas Utilizadas Atualmente e Futuras

**Atualmente:**

- Microsoft Excel (armazenamento dos dados);
- Google Drive (compartilhamento de arquivos);
- Bizagi Modeler (para BPMN);
- Ferramentas de bioinformática localmente instaladas.

**Plataformas Futuras:**

- Sistema de banco de dados relacional;
- Interface web para cadastro e consulta dos dados;

####  Integração com Outros Aplicativos Existentes

- A plataforma deverá ser compatível com ferramentas como **Excel** e **Google Sheets**, permitindo importação/exportação de dados.
- Possibilidade de exportar dados em formatos padronizados (CSV, JSON) para submissão em bases externas.



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

