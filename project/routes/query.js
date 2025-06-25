// Rotas para execução de consultas SQL - Suporte MySQL e PostgreSQL
const express = require('express');
const { executeQuery, getDatabaseInfo } = require('../db');
const router = express.Router();

// Validar consulta SQL (verificações básicas de segurança)
function validateQuery(query) {
  // Verificar se a query é uma string não vazia
  if (!query || typeof query !== 'string') {
    return { valid: false, message: 'A consulta deve ser uma string não vazia' };
  }

  const trimmedQuery = query.trim();
  if (trimmedQuery.length === 0) {
    return { valid: false, message: 'A consulta não pode estar vazia' };
  }

  // Verificar tamanho máximo da query (evitar queries muito grandes)
  if (trimmedQuery.length > 10000) {
    return { valid: false, message: 'Consulta muito longa (máximo 10.000 caracteres)' };
  }

  // OPCIONAL: Restringir apenas a consultas SELECT (descomente para produção)
  // const operacoesPerigrosas = ['DROP', 'DELETE', 'UPDATE', 'INSERT', 'ALTER', 'CREATE', 'TRUNCATE'];
  // const upperQuery = trimmedQuery.toUpperCase();
  // for (const operacao of operacoesPerigrosas) {
  //   if (upperQuery.includes(operacao)) {
  //     return { valid: false, message: `Operações ${operacao} não são permitidas` };
  //   }
  // }

  return { valid: true };
}

// POST /query - Executar consulta SQL
router.post('/', async (req, res) => {
  try {
    const { query } = req.body;

    // Validar entrada
    const validation = validateQuery(query);
    if (!validation.valid) {
      return res.status(400).json({
        success: false,
        error: validation.message
      });
    }

    // Obter informações do banco atual
    const dbInfo = getDatabaseInfo();
    console.log(`🔍 Executando query no ${dbInfo.type.toUpperCase()}: ${query.substring(0, 100)}...`);

    // Executar consulta
    const result = await executeQuery(query);

    if (result.success) {
      // Limitar resultados para evitar respostas muito grandes (máximo 1000 linhas)
      const limitedData = Array.isArray(result.data) && result.data.length > 1000 
        ? result.data.slice(0, 1000) 
        : result.data;

      res.json({
        success: true,
        query: query,
        database: dbInfo,
        rowCount: result.rowCount,
        data: limitedData,
        fields: result.fields,
        limited: Array.isArray(result.data) && result.data.length > 1000,
        executedAt: new Date().toISOString()
      });
    } else {
      // Retornar erro da consulta
      res.status(400).json({
        success: false,
        error: result.error,
        code: result.code,
        query: query,
        database: dbInfo
      });
    }
  } catch (error) {
    console.error('Erro na execução da consulta:', error);
    res.status(500).json({
      success: false,
      error: 'Erro interno do servidor',
      message: error.message
    });
  }
});

// GET /query/test - Testar conexão com banco de dados
router.get('/test', async (req, res) => {
  try {
    const dbInfo = getDatabaseInfo();
    
    // Executar query de teste simples
    const testQuery = 'SELECT 1 as test_connection';
    const testResult = await executeQuery(testQuery);
    
    if (testResult.success) {
      res.json({
        success: true,
        message: `Conexão com ${dbInfo.type.toUpperCase()} funcionando corretamente`,
        database: dbInfo,
        timestamp: new Date().toISOString()
      });
    } else {
      res.status(500).json({
        success: false,
        error: `Falha na conexão com ${dbInfo.type.toUpperCase()}`,
        details: testResult.error,
        database: dbInfo
      });
    }
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Falha no teste de conexão',
      message: error.message
    });
  }
});

// GET /query/info - Obter informações sobre o banco configurado
router.get('/info', (req, res) => {
  const dbInfo = getDatabaseInfo();
  res.json({
    success: true,
    database: dbInfo,
    message: `Conectado ao ${dbInfo.type.toUpperCase()}`,
    timestamp: new Date().toISOString()
  });
});

module.exports = router;