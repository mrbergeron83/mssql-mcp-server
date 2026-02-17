#!/bin/bash
# Start the MSSQL MCP Server

echo "Starting MSSQL MCP Server..."
docker-compose up -d

echo ""
echo "Waiting for server to start..."
sleep 3

# Check if server is running
if curl -s http://localhost:3333/ > /dev/null 2>&1; then
    echo "✓ Server is running successfully!"
    echo ""
    echo "Server URL: http://localhost:3333"
    echo "SSE Endpoint: http://localhost:3333/sse"
    echo ""
    echo "View logs: docker-compose logs -f"
    echo "Stop server: docker-compose down"
else
    echo "✗ Server failed to start. Check logs:"
    docker-compose logs --tail=20
fi
