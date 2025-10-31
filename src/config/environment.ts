// src/config/environment.ts

import dotenv from 'dotenv';

dotenv.config();

export const environment = {
    port: process.env.PORT || 3000,
    apiKey: process.env.API_KEY || '',
    dbConnectionString: process.env.DB_CONNECTION_STRING || '',
    // Adicione outras variáveis de ambiente conforme necessário
};