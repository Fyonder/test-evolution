# ==============================
# Dockerfile - Evolution API
# ==============================
FROM node:20-alpine

# Instala dependências básicas
RUN apk add --no-cache git bash python3 make g++ curl

# Define diretório de trabalho
WORKDIR /app

# ==============================
# Clona o repositório e branch correta
# ==============================
RUN git clone https://github.com/EvolutionAPI/evolution-api.git . \
    && git fetch origin evolution:evolution \
    && git checkout evolution

# ==============================
# Instala dependências e Prisma
# ==============================
# Instala dependências NPM
RUN npm install --legacy-peer-deps

# Instala Prisma CLI globalmente (versão compatível)
RUN npm install -g prisma@4.17.0 @prisma/client@4.17.0

# ==============================
# Configura banco de dados
# ==============================
# Se for SQLite, cria o arquivo local
RUN mkdir -p ./prisma \
    && touch ./database.db

# Configura variável DATABASE_URL default se não existir
ENV DATABASE_URL="file:./database.db"

# Gera Prisma Client
RUN npx prisma generate --schema=./prisma/schema.prisma || echo "Prisma schema não encontrado, verifique a branch evolution"

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
