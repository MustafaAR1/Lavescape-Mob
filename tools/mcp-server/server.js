const express = require('express');
const axios = require('axios');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;
const FIGMA_TOKEN = process.env.FIGMA_TOKEN;
const FIGMA_API = 'https://api.figma.com/v1';

app.use(express.json());

app.get('/figma/file/:fileKey', async (req, res) => {
    const { fileKey } = req.params;
    try {
        const r = await axios.get(`${FIGMA_API}/files/${fileKey}`, {
            headers: { 'X-Figma-Token': FIGMA_TOKEN }
        });
        res.json(r.data);
    } catch (err) {
        const status = err.response ? err.response.status : 500;
        res.status(status).json({ error: err.message, details: err.response ? err.response.data : null });
    }
});

app.get('/figma/images/:fileKey', async (req, res) => {
    const { fileKey } = req.params;
    const params = { ...req.query };
    try {
        const r = await axios.get(`${FIGMA_API}/images/${fileKey}`, {
            headers: { 'X-Figma-Token': FIGMA_TOKEN },
            params
        });
        res.json(r.data);
    } catch (err) {
        const status = err.response ? err.response.status : 500;
        res.status(status).json({ error: err.message, details: err.response ? err.response.data : null });
    }
});

// simple health
app.get('/_health', (_req, res) => res.json({ ok: true }));

app.listen(PORT, () => console.log(`MCP-style Figma proxy listening on ${PORT}`));
