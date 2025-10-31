import express from 'express';
import { json } from 'body-parser';
import { setupRoutes } from './routes/api.routes';
import { config } from './config/environment';

const app = express();
const PORT = config.port || 3000;

app.use(json());
setupRoutes(app);

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});