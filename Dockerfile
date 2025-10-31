FROM node:20-alpine

RUN apk add --no-cache git bash

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps

RUN chmod +x ./start.sh

EXPOSE 8080

CMD ["sh", "./start.sh"]
