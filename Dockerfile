FROM node:20-alpine

# Instalar git e bash
RUN apk add --no-cache git bash

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps

# Dar permissão ao script
RUN chmod +x ./start.sh

EXPOSE 8080

# Executar com bash para evitar erro de shell
CMD ["bash", "./start.sh"]
