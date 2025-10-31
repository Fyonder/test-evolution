# Usa Node.js 18 estável com imagem leve
FROM node:18-bullseye-slim

# Define variáveis principais do ambiente
ENV NODE_ENV=production
ENV N8N_RELEASE_TYPE=EVO
ENV N8N_PORT=5678
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true
ENV DB_SQLITE_POOL_SIZE=1
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  build-essential \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

# Define diretório de trabalho
WORKDIR /usr/local/app

# Clona o repositório oficial do n8n e muda para a branch evolution
RUN git clone https://github.com/n8n-io/n8n.git . \
  && git fetch origin evolution:evolution \
  && git checkout evolution \
  && npm install --legacy-peer-deps \
  && npm run build

# Expõe a porta padrão do n8n
EXPOSE 5678

# Define o comando padrão
CMD ["n8n", "start"]
