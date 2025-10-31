FROM node:20-alpine

RUN apk add --no-cache git

# Clona a Evolution API (branch principal)
RUN git clone https://github.com/EvolutionAPI/evolution-api.git /app

WORKDIR /app

# Instala dependências
RUN npm install --legacy-peer-deps

# Compila
RUN npm run build

EXPOSE 8080

# Inicia o servidor
CMD ["npm", "start"]
