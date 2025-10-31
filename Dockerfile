# ==============================
# Dockerfile para Evolution API (pré-compilada)
# ==============================
FROM node:20-alpine

# Instala git e bash
RUN apk add --no-cache git bash

# Cria diretório da aplicação
WORKDIR /app

# Clona a branch principal (que já inclui build compilado em dist/)
RUN git clone https://github.com/EvolutionAPI/evolution-api.git . \
    && git checkout main

# Instala dependências (não precisa gerar Prisma)
RUN npm install --legacy-peer-deps

# Expõe porta padrão da API
EXPOSE 8080

# Inicia o servidor diretamente do dist
CMD ["node", "dist/index.js"]
