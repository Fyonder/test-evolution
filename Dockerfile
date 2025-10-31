FROM node:18-alpine

# Instalar git e outras dependências básicas
RUN apk add --no-cache git bash

WORKDIR /app

COPY . .

# Instalar dependências do projeto
RUN npm install --legacy-peer-deps

EXPOSE 8080

CMD ["sh", "./start.sh"]
