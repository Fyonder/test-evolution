# ==============================
# Dockerfile - Evolution API
# ==============================
FROM node:20-alpine

# Instala dependências básicas
RUN apk add --no-cache git bash python3 make g++

# Define diretório de trabalho
WORKDIR /app

# ==============================
# Clona o repositório na branch main
# ==============================
RUN git clone https://github.com/EvolutionAPI/evolution-api.git . \
    && git checkout main

# ==============================
# Instala dependências NPM
# ==============================
RUN npm install --legacy-peer-deps

# ==============================
# Gera Prisma Client se schema existir
# ==============================
RUN if [ -f "./prisma/schema.prisma" ]; then \
        npx prisma generate --schema=./prisma/schema.prisma; \
    else \
        echo "Prisma schema não encontrado, ignorando geração do client"; \
    fi

# ==============================
# Compila TypeScript
# ==============================
RUN npm run build

# ==============================
# Porta exposta
# ==============================
EXPOSE 8080

# ==============================
# Comando para iniciar a API
# ==============================
CMD ["npm", "start"]
