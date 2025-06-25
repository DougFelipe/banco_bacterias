# 🧬 API Executor SQL Multiplataforma - MySQL & PostgreSQL

Uma poderosa API Express.js que executa consultas SQL contra bancos de dados **MySQL** e **PostgreSQL** dinamicamente, retornando resultados em formato JSON. Perfeita para análise de dados científicos, dashboards administrativos e validação rápida de dados em múltiplas plataformas de banco.

## 🆕 Novidades da Versão 2.0

- ✅ **Suporte Multiplataforma**: MySQL e PostgreSQL
- ✅ **Troca Dinâmica**: Altere entre bancos via variável de ambiente
- ✅ **Interface Atualizada**: Mostra informações do banco atual
- ✅ **Comentários em Português**: Código totalmente documentado
- ✅ **Arquitetura Modular**: Conexões organizadas e reutilizáveis

## 📁 Estrutura do Projeto

```
bacteriadb-sql-executor/
├── index.js              # Servidor principal com comentários
├── db.js                 # Conexões MySQL e PostgreSQL
├── routes/
│   └── query.js          # Rotas de consulta comentadas
├── pages/
│   └── index.html        # Interface web atualizada
├── static/
│   └── style.css         # Estilos responsivos
├── .env                  # Configurações de ambiente
├── package.json          # Dependências (mysql2 + pg)
└── README.md            # Esta documentação
```

## 📦 Instalação e Configuração

### 1. Instalar Dependências
```bash
npm install
```

### 2. Configurar Variáveis de Ambiente

Edite o arquivo `.env` para configurar o tipo de banco e credenciais:

```env
# Tipo de banco: 'mysql' ou 'postgres'
DB_TYPE=mysql

# Configurações do Banco
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha
DB_NAME=bacteriadb
DB_PORT=3306

# Porta do Servidor
PORT=3010
```

### 3. Configurações por Tipo de Banco

#### Para MySQL:
```env
DB_TYPE=mysql
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=senha123
DB_NAME=bacteriadb
DB_PORT=3306
```

#### Para PostgreSQL:
```env
DB_TYPE=postgres
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=senha123
DB_NAME=bacteriadb
DB_PORT=5432
```

### 4. Iniciar o Servidor
```bash
npm start
```

A API estará disponível em `http://localhost:3010`

## 🔄 Como Alternar Entre Bancos

1. **Pare o servidor** (Ctrl+C)
2. **Edite o arquivo `.env`** e altere `DB_TYPE`:
   - Para MySQL: `DB_TYPE=mysql`
   - Para PostgreSQL: `DB_TYPE=postgres`
3. **Ajuste as credenciais** conforme necessário
4. **Reinicie o servidor**: `npm start`

## 📡 Endpoints da API

### POST /query
Executa qualquer consulta SQL no banco configurado.

**Requisição:**
```json
{
  "query": "SELECT * FROM usuario LIMIT 5;"
}
```

**Resposta (Sucesso):**
```json
{
  "success": true,
  "query": "SELECT * FROM usuario LIMIT 5;",
  "database": {
    "type": "mysql",
    "host": "localhost",
    "port": "3306",
    "database": "bacteriadb",
    "user": "root"
  },
  "rowCount": 5,
  "data": [
    {
      "id": 1,
      "nome": "João Silva",
      "email": "joao@email.com"
    }
  ],
  "fields": [
    {"name": "id", "type": 3},
    {"name": "nome", "type": 253}
  ],
  "limited": false,
  "executedAt": "2025-01-27T10:30:00.000Z"
}
```

### GET /query/test
Testa a conexão com o banco configurado.

**Resposta:**
```json
{
  "success": true,
  "message": "Conexão com MYSQL funcionando corretamente",
  "database": {
    "type": "mysql",
    "host": "localhost",
    "port": "3306",
    "database": "bacteriadb"
  },
  "timestamp": "2025-01-27T10:30:00.000Z"
}
```

### GET /query/info
Obtém informações sobre o banco configurado.

**Resposta:**
```json
{
  "success": true,
  "database": {
    "type": "postgres",
    "host": "localhost",
    "port": "5432",
    "database": "bacteriadb",
    "user": "postgres"
  },
  "message": "Conectado ao POSTGRESQL",
  "timestamp": "2025-01-27T10:30:00.000Z"
}
```

### GET /health
Verificação de saúde da API.

**Resposta:**
```json
{
  "status": "OK",
  "service": "API Executor SQL Multiplataforma",
  "version": "2.0.0",
  "supportedDatabases": ["MySQL", "PostgreSQL"],
  "currentDatabase": "mysql",
  "timestamp": "2025-01-27T10:30:00.000Z"
}
```

## 💻 Interface Web

Acesse `http://localhost:3010` para usar a interface web que inclui:

- ✅ **Execução de consultas** com editor SQL
- ✅ **Teste de conectividade** com o banco atual
- ✅ **Informações do banco** (tipo, host, porta, etc.)
- ✅ **Resultados formatados** em tabelas responsivas
- ✅ **Indicador visual** do tipo de banco conectado
- ✅ **Atalhos de teclado** (Ctrl+Enter para executar)

## 📥 Exemplos de Uso

### Usando cURL (MySQL):
```bash
curl -X POST http://localhost:3010/query \
  -H "Content-Type: application/json" \
  -d '{"query": "SELECT COUNT(*) as total_usuarios FROM usuario;"}'
```

### Usando cURL (PostgreSQL):
```bash
curl -X POST http://localhost:3010/query \
  -H "Content-Type: application/json" \
  -d '{"query": "SELECT version();"}'
```

### Usando JavaScript fetch:
```javascript
const response = await fetch('http://localhost:3010/query', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    query: 'SELECT * FROM bacteria WHERE species = \'E. coli\' LIMIT 10;'
  })
});

const result = await response.json();
console.log(`Executado no ${result.database.type.toUpperCase()}`);
console.log(result.data);
```

### Usando Python requests:
```python
import requests

response = requests.post('http://localhost:3010/query', 
  json={'query': 'SELECT * FROM experimentos ORDER BY data DESC LIMIT 5;'}
)

data = response.json()
print(f"Banco: {data['database']['type'].upper()}")
print(f"Resultados: {data['rowCount']} linhas")
```

## 🔧 Dependências Instaladas

### Principais:
- **express**: Framework web para Node.js
- **mysql2**: Driver MySQL com suporte a Promises
- **pg**: Driver PostgreSQL nativo
- **dotenv**: Gerenciamento de variáveis de ambiente
- **cors**: Middleware para requisições cross-origin

### Instalação manual (se necessário):
```bash
npm install express mysql2 pg dotenv cors
```

## ⚠️ Considerações de Segurança

### Configuração Atual (Desenvolvimento)
- ✅ **Todas as operações SQL permitidas** (SELECT, INSERT, UPDATE, DELETE, etc.)
- ✅ **Limitação de resultados** (máximo 1000 linhas por consulta)
- ✅ **Pool de conexões** para melhor performance
- ✅ **Validação básica** de entrada

### Recomendações para Produção

#### 1. Restringir Tipos de Consulta
Descomente no arquivo `routes/query.js`:
```javascript
const operacoesPerigrosas = ['DROP', 'DELETE', 'UPDATE', 'INSERT', 'ALTER', 'CREATE', 'TRUNCATE'];
```

#### 2. Adicionar Autenticação
```javascript
const jwt = require('jsonwebtoken');
app.use('/query', authenticateToken);
```

#### 3. Rate Limiting
```javascript
const rateLimit = require('express-rate-limit');
app.use('/query', rateLimit({ 
  windowMs: 15 * 60 * 1000, // 15 minutos
  max: 100 // máximo 100 requisições por IP
}));
```

#### 4. Sanitização de Entrada
- Validar padrões de consulta
- Escapar caracteres especiais
- Usar consultas parametrizadas quando possível

#### 5. Logs de Auditoria
```javascript
// Registrar todas as consultas executadas
console.log(`[${new Date().toISOString()}] ${req.ip}: ${query}`);
```

## 🚀 Casos de Uso

### Pesquisa Científica
- Análise de dados bacteriológicos
- Consultas complexas em datasets grandes
- Comparação entre diferentes SGBDs

### Dashboards Administrativos
- Visualização de dados em tempo real
- Relatórios personalizados
- Monitoramento de sistemas

### Validação de Dados
- Verificação rápida de conteúdo
- Testes de integridade
- Migração entre bancos

### Integração de APIs
- Backend para aplicações web
- Microserviços de dados
- ETL (Extract, Transform, Load)

## 🛠️ Solução de Problemas

### Problemas Comuns

#### 1. Falha na Conexão com Banco
```bash
❌ Falha na conexão com MYSQL: connect ECONNREFUSED
```
**Solução:**
- Verifique se o MySQL/PostgreSQL está rodando
- Confirme credenciais no `.env`
- Teste conexão manual: `mysql -u root -p` ou `psql -U postgres`

#### 2. Banco de Dados Não Existe
```bash
❌ Database 'bacteriadb' doesn't exist
```
**Solução:**
```sql
-- MySQL
CREATE DATABASE bacteriadb;

-- PostgreSQL
CREATE DATABASE bacteriadb;
```

#### 3. Porta em Uso
```bash
Error: listen EADDRINUSE :::3010
```
**Solução:**
- Altere `PORT` no `.env`
- Mate processos: `lsof -ti:3010 | xargs kill`

#### 4. Timeout de Consulta
**Solução:**
- Otimize consultas lentas
- Adicione índices no banco
- Aumente timeout em `db.js`

### Modo Debug
Ative logs detalhados:
```env
NODE_ENV=development
DEBUG=true
```

## 📊 Dicas de Performance

### 1. Otimização de Consultas
```sql
-- Use LIMIT para restringir resultados
SELECT * FROM tabela_grande LIMIT 100;

-- Adicione índices para colunas frequentemente consultadas
CREATE INDEX idx_usuario_email ON usuario(email);
```

### 2. Pool de Conexões
O sistema já usa pools otimizados:
- **MySQL**: 10 conexões simultâneas
- **PostgreSQL**: 10 conexões simultâneas

### 3. Cache de Consultas
Implemente cache na camada da aplicação:
```javascript
const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 600 }); // 10 minutos
```

### 4. Monitoramento
```javascript
// Tempo de execução de consultas
const startTime = Date.now();
const result = await executeQuery(query);
const executionTime = Date.now() - startTime;
console.log(`Consulta executada em ${executionTime}ms`);
```

## 🔄 Migração Entre Bancos

### MySQL para PostgreSQL
```javascript
// Diferenças principais:
// MySQL: LIMIT 10
// PostgreSQL: LIMIT 10

// MySQL: AUTO_INCREMENT
// PostgreSQL: SERIAL ou GENERATED ALWAYS AS IDENTITY

// MySQL: TINYINT(1)
// PostgreSQL: BOOLEAN
```

### Consultas Compatíveis
```sql
-- Funciona em ambos
SELECT * FROM usuarios WHERE ativo = true;
SELECT COUNT(*) FROM pedidos;
SELECT DISTINCT categoria FROM produtos;
```

---

## 📞 Suporte

Para dúvidas ou problemas:

1. **Verifique os logs** do servidor
2. **Teste a conexão** via `/query/test`
3. **Consulte a documentação** do seu SGBD
4. **Valide as consultas** em cliente SQL antes de usar a API

---

**⚠️ Importante**: Esta API fornece acesso direto ao banco de dados. Use medidas de segurança apropriadas em ambientes de produção, incluindo autenticação, autorização e restrições de consulta.

**🎯 Objetivo**: Facilitar a execução de consultas SQL dinâmicas em múltiplas plataformas de banco, útil para cientistas, desenvolvedores e administradores de dados que precisam de flexibilidade e portabilidade.