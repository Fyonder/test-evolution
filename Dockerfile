# Usa Node.js 18 LTS baseado em Debian Bullseye (leve e estável)
FROM node:18-bullseye-slim

# Variáveis básicas de ambiente
ENV NODE_ENV=production
ENV N8N_RELEASE_TYPE=EVO
ENV N8N_PORT=5678
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true
ENV DB_SQLITE_POOL_SIZE=1
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true
ENV N8N_PATH=/usr/local/app
ENV HOME=/root
ENV N8N_EDITOR_BASE_URL=${N8N_EDITOR_BASE_URL:-http://localhost:5678}
ENV N8N_PUBLIC_API_DISABLED=false
ENV N8N_DIAGNOSTICS_ENABLED=false

# Instala dependências essenciais do sistema
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  build-essential \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

# Cria o diretório de trabalho
WORKDIR /usr/local/app

# Clona o repositório oficial do n8n Evolution
RUN git clone https://github.com/n8n-io/n8n-evolution.git . \
  && npm install --legacy-peer-deps \
  && npm run build

# Cria diretório para o banco de dados SQLite e dados persistentes
RUN mkdir -p /root/.n8n && chmod -R 777 /root/.n8n

# Expõe a porta padrão do n8n Evolution
EXPOSE 5678

# Comando padrão de inicialização
CMD ["n8n", "start"]
