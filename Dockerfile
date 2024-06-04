# Use uma imagem base do PHP com Apache
FROM php:8.1-apache

# Instale dependências necessárias
RUN apt-get update && \
    apt-get install -y unzip zip git && \
    docker-php-ext-install pdo pdo_mysql

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Habilite a mod_rewrite do Apache
RUN a2enmod rewrite

# Defina o diretório de trabalho
WORKDIR /var/www/html

# Ajuste permissões para o diretório /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod -R 775 /var/www/html

# Exponha a porta 80
EXPOSE 80

# Inicie o servidor Apache
CMD ["apache2-foreground"]
