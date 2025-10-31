// src/instances/index.ts

import { createClient } from 'some-api-client-library'; // Exemplo de biblioteca de cliente de API
import { connectToDatabase } from 'some-database-library'; // Exemplo de biblioteca de conexão com banco de dados

// Instância do cliente da API
const apiClient = createClient({
    apiKey: process.env.API_KEY,
    baseUrl: process.env.API_BASE_URL,
});

// Instância da conexão com o banco de dados
const dbConnection = connectToDatabase({
    uri: process.env.DB_URI,
});

// Exportando as instâncias
export { apiClient, dbConnection };