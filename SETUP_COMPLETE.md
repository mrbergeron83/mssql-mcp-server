# MSSQL MCP Server - Setup Complete! 🎉

Your MSSQL MCP Server is now fully configured and ready to use with Claude Code!

## ✅ What's Been Set Up

1. **Docker Container** - The MCP server runs in a Docker container for easy management
2. **Database Connection** - Connected to your SQL Server at `host.docker.internal:5252`
3. **Claude Code Plugin** - Plugin installed at `~/.claude/plugins/user/mssql-mcp/`
4. **Convenience Scripts** - Easy start/stop scripts created

## 🚀 Quick Start

### Start the Server
```bash
./start.sh
# OR
docker-compose up -d
```

### Stop the Server
```bash
./stop.sh
# OR
docker-compose down
```

### View Logs
```bash
./logs.sh
# OR
docker-compose logs -f
```

## 🔌 Using with Claude Code

The MCP server plugin is already enabled in your Claude Code settings!

**Plugin Location:** `~/.claude/plugins/user/mssql-mcp/`

**Server URL:** `http://localhost:3333/sse`

### Available Tools

Once the server is running, you'll have access to these MCP tools in Claude Code:

1. **mcp_discover_database** - Explore your database structure
2. **mcp_execute_query** - Run SQL queries
3. **mcp_table_details** - Get table schema information
4. **mcp_discover_tables** - Find tables by pattern
5. **mcp_paginated_query** - Query with pagination
6. And 20+ more tools!

### Example Usage in Claude Code

Just ask Claude to interact with your database:

```
"Show me all tables in the database"
"Query the top 10 rows from the Users table"
"What's the schema of the Orders table?"
"Find all customers from California"
```

## 📊 Server Endpoints

- **Status:** http://localhost:3333/
- **SSE Endpoint:** http://localhost:3333/sse
- **Tools List:** http://localhost:3333/tools
- **Diagnostics:** http://localhost:3333/diagnostic
- **Query Results:** http://localhost:3333/query-results

## 🔧 Configuration

### Database Settings (.env file)
```
DB_SERVER=host.docker.internal
DB_PORT=5252
DB_DATABASE=master
DB_USER=sa
DB_PASSWORD=myComplexPass123!@
```

### Docker Settings (docker-compose.yml)
- Port: 3333
- Transport: SSE
- Restart: unless-stopped
- Volumes: query_results, logs

## 📝 Common Commands

```bash
# Check if server is running
curl http://localhost:3333/

# View available tools
curl http://localhost:3333/tools

# Run diagnostics
curl http://localhost:3333/diagnostic

# Restart server
docker-compose restart

# Rebuild server
docker-compose up -d --build

# View container status
docker-compose ps
```

## 🐛 Troubleshooting

### Server won't start
```bash
# Check logs
docker-compose logs

# Verify database connection
curl http://localhost:3333/diagnostic
```

### Can't connect to database
- Verify SQL Server is running on port 5252
- Check database credentials in `.env` file
- Ensure Docker can reach host with `host.docker.internal`

### Port 3333 already in use
```bash
# Change PORT in .env file, then restart
docker-compose down
docker-compose up -d
```

## 📚 Documentation

- Full README: See `README.md`
- Docker Guide: See `DOCKER.md`
- Plugin Location: `~/.claude/plugins/user/mssql-mcp/`

## 🎯 Next Steps

1. Start the server: `./start.sh`
2. Open Claude Code in this directory
3. Ask Claude to explore your database!

Example:
```
"Use the MCP tools to show me what tables exist in my database"
```

---

**Need Help?** Check the logs with `./logs.sh` or visit the project README.
