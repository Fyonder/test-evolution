# Usa Node.js 20 leve
FROM node:20-alpine

# Define variáveis principais do ambiente
ENV NODE_ENV=production
ENV PORT=8080
ENV AUTHENTICATION_API_KEY=sua_chave_aqui
# Adicione outras ENV necessárias para Evolution API, como DB, etc.

# Instala dependências necessárias
RUN apk update && apk add --no-cache \
  git \
  ffmpeg \
  wget \
  curl \
  bash \
  openssl \
  && rm -rf /var/cache/apk/*

# Define diretório de trabalho
WORKDIR /usr/local/app

# Clona o repositório oficial da Evolution API e muda para a branch main
RUN git clone https://github.com/EvolutionAPI/evolution-api.git . \
  && git checkout main \
  && npm ci --silent \
  && npm run build

# Expõe a porta padrão da Evolution API
EXPOSE 8080

# Define o comando padrão
CMD ["npm", "run", "start:prod"]