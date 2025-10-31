# Usa Node.js 20 (necessário para Evolution API e Baileys)
FROM node:20-alpine

# Instalar git e bash (necessários para npm e start.sh)
RUN apk add --no-cache git bash

WORKDIR /app

# Copiar todos os arquivos
COPY . .

# Instalar dependências (Evolution API vem do GitHub)
RUN npm install --legacy-peer-deps

# Expor a porta da Evolution API
EXPOSE 8080

# Comando de inicialização
CMD ["sh", "./start.sh"]
