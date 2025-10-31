FROM node:20-alpine

# Instala dependências
RUN apk add --no-cache git

# Clona o repositório oficial da Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git /app

WORKDIR /app

# Usa a branch evolution
RUN git fetch origin evolution:evolution && git checkout evolution

# Instala dependências
RUN npm install --legacy-peer-deps

# Compila
RUN npm run build

# Porta
EXPOSE 8080

# Comando para iniciar
CMD ["npm", "start"]
