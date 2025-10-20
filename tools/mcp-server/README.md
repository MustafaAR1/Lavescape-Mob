# MCP-style Figma Proxy

This small Express server proxies requests to the Figma REST API using a personal access token. It's intended to be run locally as a lightweight MCP server for tools that need to fetch Figma files or images.

Usage

1. Copy `.env.example` to `.env` and set `FIGMA_TOKEN` to your personal access token.
2. Install dependencies:

   npm install

3. Start the server:

   npm start

Endpoints

- GET /figma/file/:fileKey -> returns the Figma file JSON
- GET /figma/images/:fileKey?ids=... -> returns images
- GET /_health -> basic health check

Notes

- This server does not implement authentication; only use locally or behind a trusted network.
- To use in PowerShell with the user's environment, run: `npm install; npm start`.
