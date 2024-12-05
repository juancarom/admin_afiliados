#!/bin/bash
set -e

# Elimina un posible servidor que pueda estar corriendo
rm -f /app/tmp/pids/server.pid

# Espera a que la base de datos esté lista
until mysql -h "$DATABASE_HOST" -u "$DATABASE_USERNAME" -p"$DATABASE_PASSWORD" -e 'SHOW DATABASES;' > /dev/null 2>&1; do
  echo "Esperando a que la base de datos esté lista..."
  sleep 3
done

# Crea la base de datos si no existe y corre las migraciones
if bundle exec rake db:exists; then
  echo "La base de datos ya existe. Corriendo migraciones..."
  bundle exec rake db:migrate
else
  echo "La base de datos no existe. Creándola..."
  bundle exec rake db:create db:migrate db:seed
fi

# Ejecuta el comando principal (inicia el servidor)
exec "$@"