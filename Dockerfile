# ── Containerfile ──────────────────────────────────────────────────
FROM php:8.3-apache

# 1. Re-configure Apache to use 8080 and set a harmless ServerName
RUN sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf \
 && echo "ServerName localhost" >> /etc/apache2/apache2.conf

# 2. Copy your app
COPY index.php /var/www/html/

# 3. Tell the world (and OpenShift) which port is served
EXPOSE 8080

# No CMD needed – base image already calls apache2-foreground
