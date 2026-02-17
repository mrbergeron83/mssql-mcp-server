#!/bin/bash
# Stop the MSSQL MCP Server

echo "Stopping MSSQL MCP Server..."
docker-compose down
echo "✓ Server stopped"
