#!/bin/sh

# composer clear-cache

# composer install or update for new added package
# composer install -n --prefer-dist
# Run Laravel migrations
php artisan migrate 

php artisan db:seed 

php artisan migrate --force
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Start the main process
exec "$@"
