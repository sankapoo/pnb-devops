# Use the official PHP 8 image with Apache pre-configured
FROM php:8.3-apache

# Copy our app into the Apache document root
COPY index.php /var/www/html/

# Expose the default web server port
EXPOSE 80

# The base image already starts Apache in the foreground, so no CMD needed
