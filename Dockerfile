FROM node:20-alpine

RUN apk add --no-cache git bash

WORKDIR /app

# Clona a versão oficial do GitHub (main branch)
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Instala dependências
RUN npm install --legacy-peer-deps

# Se o dist/ não existir, compila (opcional)
RUN if [ -f "./dist/index.js" ]; then \
        echo "dist já existe, nada a fazer"; \
    else \
        npm run build; \
    fi

EXPOSE 8080

# Inicia a API
CMD ["node", "dist/index.js"]
