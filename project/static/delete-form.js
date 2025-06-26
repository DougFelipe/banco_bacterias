// /static/delete-form.js
let dbSchema = {};

async function loadSchema() {
  const res = await fetch('/static/db-schema.json');
  dbSchema = await res.json();
}

// Helper para criar selects de tabela
function createTableSelect() {
  const select = document.createElement('select');
  select.name = 'tabela';
  select.required = true;
  select.innerHTML = `<option value="">Selecione a tabela</option>` +
    Object.keys(dbSchema).map(tab =>
      `<option value="${tab}">${tab}</option>`
    ).join('');
  return select;
}

// Renderiza o formulário com campos PKs para WHERE
function renderForm(tabela) {
  const schema = dbSchema[tabela];
  if (!schema) return document.createTextNode('Tabela não encontrada.');
  const pkFields = schema.fields.filter(f => f.pk);

  const form = document.createElement('form');
  form.innerHTML = pkFields.map(field => `
    <div class="form-group">
      <label for="delete_${field.name}">${field.name}${field.required ? ' *' : ''}</label>
      <input 
        id="delete_${field.name}" 
        name="${field.name}" 
        type="text" 
        required="${!!field.required}"
        placeholder="${field.type}"
      />
    </div>
  `).join('') + `
    <button type="submit">Deletar</button>
    <pre class="sql-preview" id="delete-sql-preview"></pre>
    <div id="delete-feedback"></div>
  `;

  // Preview ao digitar
  form.addEventListener('input', () => {
    const data = Object.fromEntries(new FormData(form));
    document.getElementById('delete-sql-preview').textContent = buildDeleteSQL(tabela, data, pkFields);
  });

  // Envio real
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const data = Object.fromEntries(new FormData(form));
    const sql = buildDeleteSQL(tabela, data, pkFields);
    document.getElementById('delete-sql-preview').textContent = sql;

    const feedback = form.querySelector('#delete-feedback');
    feedback.textContent = 'Enviando...';
    feedback.className = '';

    try {
      const resp = await fetch('/query', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ query: sql })
      });
      const res = await resp.json();
      if (res.success) {
        feedback.textContent = "Deletado com sucesso!";
        feedback.className = 'success';
      } else {
        feedback.textContent = "Erro: " + (res.error || "Falha na deleção");
        feedback.className = 'error';
      }
    } catch (err) {
      feedback.textContent = "Erro de rede: " + err.message;
      feedback.className = 'error';
    }
  });

  return form;
}

function buildDeleteSQL(tabela, data, pkFields) {
  if (!tabela || pkFields.some(f => !data[f.name])) return '';
  const where = pkFields.map(f => {
    const value = data[f.name];
    return `${f.name} = ${isNaN(Number(value)) ? `'${value}'` : value}`;
  }).join(' AND ');
  return `DELETE FROM ${tabela} WHERE ${where};`;
}

// Render inicial (seleção da tabela)
async function renderRoot() {
  await loadSchema();
  const root = document.getElementById('crud-delete-root');
  root.innerHTML = '';
  const select = createTableSelect();
  root.appendChild(select);

  let formArea = document.createElement('div');
  root.appendChild(formArea);

  select.addEventListener('change', () => {
    formArea.innerHTML = '';
    if (select.value) {
      formArea.appendChild(renderForm(select.value));
    }
  });
}
window.addEventListener('DOMContentLoaded', renderRoot);
