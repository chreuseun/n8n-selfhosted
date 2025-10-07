# NGINX Configuration for n8n

This directory contains the NGINX configuration for setting up a secure reverse proxy for your n8n instance with HTTPS support.

## Features

- HTTPS support with Let's Encrypt SSL certificates
- HTTP to HTTPS redirection
- Large file upload support (up to 2GB)
- WebSocket support for real-time features
- Optimized proxy settings for n8n

## Prerequisites

1. NGINX installed on your server
2. Domain name (e.g., n8n.yourdomain.com) pointing to your server's IP
3. Ports 80 and 443 open in your firewall
4. Certbot installed for SSL certificate generation

## Setup Instructions

### 1. Install Certbot (Let's Encrypt)

```bash
# On Ubuntu/Debian
sudo apt update
sudo apt install certbot python3-certbot-nginx

# On CentOS/RHEL
sudo yum install epel-release
sudo yum install certbot python3-certbot-nginx
```

### 2. Obtain SSL Certificate

Run the following command to obtain and install SSL certificates:

```bash
sudo certbot --nginx -d n8n.yourdomain.com
```

### 3. Install NGINX Configuration

Copy the `nginx.conf` to your NGINX sites-available directory:

```bash
sudo cp nginx.conf /etc/nginx/sites-available/n8n
sudo ln -s /etc/nginx/sites-available/n8n /etc/nginx/sites-enabled/
```

### 4. Test and Reload NGINX

```bash
# Test NGINX configuration
sudo nginx -t

# If test is successful, reload NGINX
sudo systemctl reload nginx
```

## Configuration Details

### SSL Configuration

- Uses modern SSL protocols and ciphers
- HTTP/2 enabled
- Strong security headers

### Proxy Settings

- WebSocket support for real-time features
- Large file upload support (2GB max)
- Optimized buffer sizes
- Proper headers for proxy

### Security Headers

- HSTS enabled
- X-Content-Type-Options
- X-Frame-Options
- X-XSS-Protection
- Content-Security-Policy

## Troubleshooting

### Check NGINX Error Logs

```bash
sudo tail -f /var/log/nginx/error.log
```

### Check NGINX Access Logs

```bash
sudo tail -f /var/log/nginx/access.log
```

### Renew SSL Certificates

Certificates are automatically renewed by certbot. To test renewal:

```bash
sudo certbot renew --dry-run
```

## Maintenance

### Renew SSL Certificates

Certificates are automatically renewed by certbot. The renewal process is handled by a systemd timer.

### Update Configuration

After making changes to the NGINX configuration:

1. Test the configuration: `sudo nginx -t`
2. If successful, reload NGINX: `sudo systemctl reload nginx`

## Security Notes

- Keep your server's OS and NGINX updated
- Regularly check for and apply security updates
- Monitor NGINX and system logs for unusual activity
- Consider setting up fail2ban to prevent brute force attacks

## References

- [NGINX Documentation](https://nginx.org/en/docs/)
- [Let's Encrypt Documentation](https://certbot.eff.org/docs/)
- [n8n Documentation](https://docs.n8n.io/)

---

_Last updated: October 2025_
