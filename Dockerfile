# Use Node 20 Alpine
FROM node:20-alpine

# Instala git e dependências básicas
RUN apk add --no-cache git bash python3 make g++

# Define diretório de trabalho
WORKDIR /app

# Clona a Evolution API (branch principal)
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Instala dependências do projeto
RUN npm install --legacy-peer-deps

# Gera o client do Prisma antes de compilar
RUN npx prisma generate

# Compila o TypeScript
RUN npm run build

# Exposição da porta
EXPOSE 8080

# Inicia o servidor
CMD ["npm", "start"]
