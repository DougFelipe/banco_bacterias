# Relatório do Projeto de Sistemas de Banco de Dados

**Curso:** [Banco de Dados - DIM0125]  
**Professor:** [MARCEL VINICIUS MEDEIROS OLIVEIRA]  

**Aluno:** [Douglas Felipe de Lima Silva]  
**Matrícula:** 20220054131  

**Aluno:** [ELILDES FORTALEZA SANTOS]    
**Matrícula:** 20240078023  

**Aluno:** [FELIPE MARLEY DE OLIVEIRA GOMES]    
**Matrícula:** 20210053408  


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

**Plataformas Futuras:**

- Sistema de banco de dados relacional;
- Interface web para cadastro e consulta dos dados;

####  Integração com Outros Aplicativos Existentes

- A plataforma deverá ser compatível com ferramentas como **Excel** e **Google Sheets**, permitindo importação/exportação de dados.
- Possibilidade de exportar dados em formatos padronizados (CSV, JSON) para submissão em bases externas.



### 2.4 Principais Necessidades dos Usuários e Envolvidos

A partir da análise do ambiente atual do laboratório e das interações dos usuários com os dados experimentais, foi possível identificar um conjunto de problemas centrais, suas causas e as soluções desejadas pelos envolvidos.

---

####  Problema 1: Fragmentação e Duplicidade de Dados

- **Causa:** Utilização de múltiplas planilhas e arquivos soltos, sem controle de versões nem integração entre as fontes.
- **Solução Atual:** Compartilhamento manual de arquivos via Google Drive e comunicação informal entre os membros do laboratório.
- **Solução Desejada:** Centralização dos dados em um banco relacional único, com interface de acesso controlada e registros consolidados.

**Resumo da Necessidade:**

| Prioridade | Preocupações                    | Solução Atual             | Solução Proposta                          |
|------------|----------------------------------|---------------------------|-------------------------------------------|
| Alta       | Perda de dados, inconsistência  | Planilhas desconectadas   | Banco relacional com acesso centralizado |

---

####  Problema 2: Falta de Padronização no Registro de Informações

- **Causa:** Ausência de campos obrigatórios e padronizações nas planilhas utilizadas.
- **Solução Atual:** Criação de modelos manuais (templates) com instruções informais.
- **Solução Desejada:** Implementação de um sistema com campos validados, formatos consistentes e menus controlados (ex: seleção por listas).

**Resumo da Necessidade:**

| Prioridade | Preocupações                          | Solução Atual       | Solução Proposta                                 |
|------------|----------------------------------------|---------------------|--------------------------------------------------|
| Alta       | Dados inválidos, retrabalho, ambiguidade | Templates soltos   | Validações automáticas e estrutura padronizada  |

---

####  Problema 3: Dificuldade na Rastreabilidade de Resultados

- **Causa:** Modificações nos dados não são registradas ou associadas a um responsável.
- **Solução Atual:** Depende da memória dos usuários ou da criação de anotações paralelas.
- **Solução Desejada:** Sistema com controle de usuários, histórico de alterações e identificação de autoria nos cadastros.

**Resumo da Necessidade:**

| Prioridade | Preocupações                  | Solução Atual       | Solução Proposta                            |
|------------|-------------------------------|---------------------|---------------------------------------------|
| Média      | Falta de auditoria e rastreamento | Anotações manuais  | Sistema com login e controle de versões     |

---

####  Problema 4: Baixa Eficiência na Recuperação de Dados

- **Causa:** Falta de mecanismos de busca estruturada e filtros para cruzar informações.
- **Solução Atual:** Busca visual e filtros manuais nas planilhas.
- **Solução Desejada:** Consultas flexíveis com critérios por atributos (ex: por bactéria, tipo de teste, resultado funcional).

**Resumo da Necessidade:**

| Prioridade | Preocupações                   | Solução Atual         | Solução Proposta                                  |
|------------|---------------------------------|------------------------|---------------------------------------------------|
| Alta       | Demora na análise e risco de erro | Filtros no Excel       | Sistema com formulários e consultas parametrizadas |

---

####  Problema 5: Escalabilidade limitada para novos dados e análises

- **Causa:** Estrutura atual não comporta grandes volumes ou novos tipos de dados sem reestruturações manuais.
- **Solução Atual:** Criação de novas abas ou planilhas quando necessário.
- **Solução Desejada:** Modelo de dados relacional, escalável e extensível, com suporte a novos tipos de análises e integração futura com ferramentas analíticas.

**Resumo da Necessidade:**

| Prioridade | Preocupações                       | Solução Atual     | Solução Proposta                                       |
|------------|-------------------------------------|-------------------|--------------------------------------------------------|
| Alta       | Reestruturação constante, risco de erros | Expansão manual  | Banco relacional escalável com suporte a extensões    |

---

Essas necessidades foram levantadas em diálogo com os usuários reais do sistema e orientam a priorização das funcionalidades a serem implementadas.


### 2.5 Alternativas e Concorrência

Durante a análise inicial do projeto, foram consideradas diferentes alternativas para solucionar os problemas enfrentados atualmente no gerenciamento de dados do laboratório. Abaixo, estão listadas as principais opções identificadas, incluindo soluções concorrentes, abordagens locais e a manutenção do cenário atual.

---

####  Opção 1: Manutenção do Status Quo

**Descrição:** Continuar utilizando planilhas do Excel/Google Sheets para organizar os dados de forma manual e descentralizada.

**Pontos Fortes:**
- Ferramentas conhecidas por todos os usuários;
- Sem necessidade de instalação ou desenvolvimento adicional;
- Fácil compartilhamento via Google Drive.

**Pontos Fracos:**
- Alta propensão a erros e inconsistências;
- Nenhum controle de versões ou histórico de alterações;
- Dificuldade de escalar para novos dados e análises;
- Trabalho repetitivo e baixa rastreabilidade.

---

####  Opção 2: Desenvolvimento de um Sistema Local com Interface Web e Banco de Dados

**Descrição:** Implementar um sistema customizado com banco de dados relacional, interface web para cadastro e consulta, e estrutura normalizada de dados.

**Pontos Fortes:**
- Atende exatamente às necessidades do laboratório;
- Permite controle de usuários, histórico e validação dos dados;
- Estrutura escalável e de longo prazo;
- Facilita análises estatísticas e exportações.

**Pontos Fracos:**
- Requer tempo e conhecimento técnico para o desenvolvimento;
- Necessita de manutenção contínua e apoio institucional;
- Depende da familiaridade dos usuários com a nova interface.

---

####  Opção 3: Uso de Softwares de LIMS (Laboratory Information Management Systems)

**Descrição:** Adotar uma plataforma pronta para gestão de laboratórios, como Benchling, LabWare ou openLIMS.

**Pontos Fortes:**
- Soluções profissionais, prontas para uso;
- Recursos robustos de rastreabilidade e integração com workflows;
- Suporte a anexos, resultados e documentos experimentais.

**Pontos Fracos:**
- Custo elevado (a maioria das versões completas é paga);
- Pouca flexibilidade para adaptar à estrutura de dados do laboratório;
- Necessidade de treinamento e possível resistência dos usuários;
- Alguns dados podem precisar ser convertidos ou retrabalhados.

---

###  Escolha Estratégica

Após análise das alternativas, optou-se pelo **desenvolvimento de um sistema local customizado**, pois essa abordagem:

- Equilibra custo, flexibilidade e controle;
- É compatível com a realidade do laboratório e com os objetivos da disciplina;
- Proporciona aprendizado prático aos alunos na concepção de um sistema real;
- Garante aderência ao domínio dos dados e às necessidades específicas da pesquisa.



### 2.6 Visão Geral do Produto

####  Perspectiva do Produto

O sistema a ser desenvolvido será **independente**, com uso exclusivo interno pelo laboratório de microbiologia. Seu propósito é substituir o atual modelo baseado em planilhas dispersas, oferecendo uma solução centralizada, organizada e confiável para o controle de amostras e resultados experimentais.

A interação com o sistema se dará por meio de uma **interface web**, desenvolvida em **Python**, com funcionalidades acessíveis via navegador por diferentes perfis de usuários. O sistema incluirá módulos para cadastro, atualização, consulta e geração de relatórios científicos, além de funcionalidades para análise e rastreamento de dados ao longo do tempo.

##### Componentes principais do sistema:

- **Módulo de Cadastro de Amostras**: registro de novas bactérias, consórcios e isolados;
- **Módulo de Testes e Ensaios**: inserção dos resultados funcionais, morfológicos e bioquímicos;
- **Módulo de Análise Genômica**: organização das informações de sequenciamento e dados de bioinformática;
- **Módulo de Relatórios**: geração de relatórios por filtros e exportações;
- **Controle de Usuários**: autenticação, permissões e rastreamento de modificações;
- **Banco de Dados**: armazenamento relacional estruturado e normalizado.

##### Premissas de infraestrutura:

- O sistema será hospedado nos **servidores da faculdade**, exigindo suporte a:
  - Banco de dados relacional;
  - Servidor web com suporte a Python;
  - Armazenamento seguro para os dados e backups periódicos;
  - Acesso em rede local (inicialmente), podendo ser expandido para acesso remoto.

##### Suposições:

- Os dados laboratoriais seguirão o padrão atual de estrutura, como refletido nas planilhas fornecidas;
- Novos experimentos poderão ser integrados futuramente com a adição de novas tabelas e funcionalidades;
- O sistema será utilizado além da disciplina, exigindo **documentação completa**, **interface amigável** e possibilidade de **manutenção evolutiva**.



---

####  Diagrama de Blocos do Sistema


### 📌 Diagrama de Blocos do Sistema

```
           +-----------------------+
           |    Usuários Finais    |
           | (IC, Mestrado, PhD)   |
           +----------+------------+
                      |
                      v
           +------------------------+
           |     Interface Web      |
           +----------+-------------+
                      |
    +-----------------+------------------+
    |                 |                  |
    v                 v                  v
+-----------+   +-------------+   +----------------+
| Cadastro  |   |   Testes    |   |    Genômica &  |
| de Amostras|  |   & Ensaios |   | Bioinformática |
+-----------+   +-------------+   +----------------+
     \              |                   /
      \             |                  /
       \            v                 /
        +-----------------------------+
        |     Banco de Dados          |
        +-----------------------------+


```

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

