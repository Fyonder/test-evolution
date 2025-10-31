FROM node:20-alpine

WORKDIR /app

# Instala dependências diretamente do NPM
RUN npm install -g evolution-api@latest

EXPOSE 8080

# Inicia o servidor
CMD ["evolution-api"]
