const express = require('express');
const { create } = require('@evolution-api/core');

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

// Rota de status
app.get('/status', (req, res) => {
    res.json({ status: 'online' });
});

// Inicialização do WhatsApp
let instance;

async function initWhatsApp() {
    instance = await create({
        session: "main-session",
        webhook: process.env.WEBHOOK_URL
    });
}

// Rota para enviar mensagem
app.post('/send-message', async (req, res) => {
    try {
        const { number, message } = req.body;
        await instance.sendText(`${number}@s.whatsapp.net`, message);
        res.json({ success: true });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Iniciar servidor
app.listen(PORT, async () => {
    console.log(`Servidor rodando na porta ${PORT}`);
    await initWhatsApp();
});