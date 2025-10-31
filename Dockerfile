# Usar imagem leve com Node.js 20
FROM node:20-alpine

# Instalar dependências necessárias
RUN apk add --no-cache git bash openssh

# Criar diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto
COPY . .

# Instalar dependências do projeto
RUN npm install --legacy-peer-deps

# Dar permissão de execução ao script de inicialização
RUN chmod +x ./start.sh

# Expor porta da Evolution API
EXPOSE 8080

# Executar com bash (evita erro de shell)
CMD ["bash", "./start.sh"]
