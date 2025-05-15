# ---- Containerfile -------------------------------------------------
FROM php:8.3-apache

# 1. Change EVERY reference to port 80 → 8080 and set a ServerName
RUN sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf \
 && sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:8080>/' \
        /etc/apache2/sites-enabled/000-default.conf \
 && echo "ServerName localhost" >> /etc/apache2/apache2.conf

# 2. Copy the application
COPY index.php /var/www/html/

# 3. Tell OpenShift/Podman which port is exposed
EXPOSE 8080

# apache2-foreground in the base image will now start on 8080
