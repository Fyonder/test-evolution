FROM node:20-alpine

# Dependências do sistema
RUN apk add --no-cache git bash

WORKDIR /app

# Clonar Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Instalar dependências
RUN npm install --legacy-peer-deps

# Expõe porta padrão
EXPOSE 8080

# Inicia API sem build TS nem Prisma
CMD ["node", "dist/index.js"]
