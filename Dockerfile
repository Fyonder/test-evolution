# Usa Node.js 18 estável
FROM node:18-bullseye-slim

ENV NODE_ENV=production
ENV N8N_RELEASE_TYPE=EVO
ENV N8N_PORT=5678
ENV DB_TYPE=sqlite
ENV DB_SQLITE_VACUUM_ON_STARTUP=true
ENV DB_SQLITE_POOL_SIZE=1
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true

# Instala dependências essenciais
RUN apt-get update && apt-get install -y \
  git \
  python3 \
  build-essential \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app

# Clona e instala o n8n Evolution
RUN git clone https://github.com/n8n-io/n8n-evolution.git . \
  && npm install --legacy-peer-deps \
  && npm run build

EXPOSE 5678

CMD ["n8n", "start"]
