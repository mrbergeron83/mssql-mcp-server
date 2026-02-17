# Docker Setup for MSSQL MCP Server

This guide helps you run the MSSQL MCP Server in Docker.

## Quick Start

### 1. Build the Docker Image

```bash
docker-compose build
```

### 2. Start the Server

```bash
docker-compose up -d
```

The server will be available at `http://localhost:3333`

### 3. Stop the Server

```bash
docker-compose down
```

## Configuration

### Using Environment Variables

You can override the default configuration by setting environment variables before running docker-compose:

```bash
export DB_SERVER=your-sql-server-host
export DB_PORT=1433
export DB_DATABASE=your-database
export DB_USER=your-username
export DB_PASSWORD=your-password
docker-compose up -d
```

### Using .env File

Alternatively, the docker-compose.yml will automatically read from your `.env` file if it exists.

### Connecting to SQL Server on Host Machine

If your SQL Server is running on your host machine (not in Docker), you need to:

1. Uncomment the `extra_hosts` section in `docker-compose.yml`
2. Set `DB_SERVER=host.docker.internal` in your environment variables or .env file

Example:
```bash
export DB_SERVER=host.docker.internal
docker-compose up -d
```

## Useful Commands

### View Logs

```bash
docker-compose logs -f
```

### Restart the Server

```bash
docker-compose restart
```

### Rebuild and Restart

```bash
docker-compose up -d --build
```

### Execute Commands Inside Container

```bash
docker-compose exec mssql-mcp-server sh
```

### Check Server Health

```bash
curl http://localhost:3333/
```

### View Available Tools

```bash
curl http://localhost:3333/tools
```

### Run Diagnostics

```bash
curl http://localhost:3333/diagnostic
```

## Using with Claude Code

Once the Docker container is running, you can connect to it from Claude Code using the MCP plugin configuration:

The plugin is already configured at: `~/.claude/plugins/user/mssql-mcp/`

Just make sure the server is running with `docker-compose up -d`

## Persistence

The following directories are persisted via Docker volumes:
- `./query_results` - Saved query results
- `./logs` - Server logs

These will survive container restarts and rebuilds.

## Troubleshooting

### Can't connect to database

1. Check if SQL Server is accessible from Docker:
   ```bash
   docker-compose exec mssql-mcp-server ping your-sql-server-host
   ```

2. Verify database credentials in environment variables

3. Check the logs:
   ```bash
   docker-compose logs
   ```

### Port already in use

If port 3333 is already in use, you can change it by setting the PORT environment variable:

```bash
export PORT=3334
docker-compose up -d
```

Don't forget to update the MCP plugin configuration in `~/.claude/plugins/user/mssql-mcp/.mcp.json` to use the new port.
