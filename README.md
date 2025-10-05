# n8n Self-Hosted Setup

A production-ready, self-hosted n8n workflow automation platform using Docker Compose.

## Features

- 🐳 Dockerized n8n with PostgreSQL database
- 🔒 Secure configuration with environment variables
- 🔄 Persistent storage for workflows and database
- 🌐 Nginx reverse proxy configuration included
- 🛡️ Network isolation for security
- 📦 Easy deployment and updates

## Prerequisites

- Docker and Docker Compose installed
- Basic knowledge of Docker and n8n

## Quick Start

1. Clone this repository
2. Copy `.env.template` to `.env` and update the values:
   ```bash
   cp .env.template .env
   ```
3. Start the services:
   ```bash
   docker-compose up -d
   ```
4. Access n8n at: http://localhost:5678

## 📖 Documentation

### Project Structure

```
n8n-selfhosted/
├── .env                    # Environment variables (created from .env.template)
├── .env.template          # Template for environment variables
├── docker-compose.yml     # Docker Compose configuration
├── Dockerfile             # Custom n8n Docker image
├── nginx.conf             # Nginx reverse proxy configuration
├── ffmpeg/                # FFmpeg configuration (if needed)
└── init-data.sh           # Initial data setup script (if applicable)
```

### Detailed Setup Guide

#### 1. Environment Configuration

1. Copy the environment template:
   ```bash
   cp .env.template .env
   ```

2. Edit the `.env` file with your configuration:
   - Database credentials
   - n8n encryption key (generate a strong one)
   - Webhook URL (if using webhooks)
   - Timezone settings

#### 2. Database Configuration

The setup uses PostgreSQL with the following defaults:
- Port: 5433 (mapped from container's 5432)
- Data volume: `db_storage`
- Auto-initializes the database on first run

#### 3. n8n Configuration

Key n8n settings in `.env`:
- `N8N_PORT`: Web interface port (default: 5678)
- `N8N_ENCRYPTION_KEY`: Required for encrypting credentials
- `N8N_BASIC_AUTH_ACTIVE`: Enable basic auth (recommended for production)
- `N8N_BASIC_AUTH_USER`/`N8N_BASIC_AUTH_PASSWORD`: Basic auth credentials

#### 4. Nginx Configuration

The included `nginx.conf` provides:
- Reverse proxy to n8n
- SSL termination (if configured)
- Security headers
- Gzip compression

### 🚀 Deployment

1. Start all services:
   ```bash
   docker-compose up -d
   ```

2. Verify containers are running:
   ```bash
   docker-compose ps
   ```

3. Access n8n at: http://your-server-ip:5678

### 🔧 Common Operations

#### Backup Database
```bash
docker exec -t n8n_postgres pg_dump -U your_db_user -d your_db_name > backup.sql
```

#### Restore Database
```bash
cat backup.sql | docker exec -i n8n_postgres psql -U your_db_user -d your_db_name
```

#### View Logs
```bash
# n8n logs
docker-compose logs -f n8n

# Database logs
docker-compose logs -f postgres
```

### 🔄 Updating

1. Pull the latest images:
   ```bash
   docker-compose pull
   ```

2. Recreate containers:
   ```bash
   docker-compose up -d --force-recreate
   ```

### 🛠️ Troubleshooting

#### Common Issues

1. **Port Conflicts**:
   - Check if ports 5678 or 5433 are already in use
   - Update ports in `.env` and `docker-compose.yml` if needed

2. **Permission Issues**:
   - Ensure Docker has proper permissions to create volumes
   - Run `chmod -R 777 volumes/` if using bind mounts (not recommended for production)

3. **Database Connection Issues**:
   - Verify PostgreSQL is running: `docker-compose ps`
   - Check logs: `docker-compose logs postgres`

### 📚 Additional Resources

- [n8n Documentation](https://docs.n8n.io/)
- [Docker Compose Reference](https://docs.docker.com/compose/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

### 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [Your Name/Organization]
   cp .env.template .env