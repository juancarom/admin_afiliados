# Usa una imagen base de Ruby
FROM ruby:3.2.2

# Instala dependencias
RUN apt-get update -qq && apt-get install -y curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn

# Configura el directorio de trabajo
WORKDIR /app

# Copia el Gemfile y Gemfile.lock
COPY Gemfile* ./

# Instala las gemas
RUN bundle install

# Copia los archivos de dependencias de JavaScript
COPY package.json yarn.lock ./

# Instala las dependencias de JavaScript
RUN yarn install

# Copia el resto de la aplicación
COPY . .

# Establece SECRET_KEY_BASE para el entorno production
ENV SECRET_KEY_BASE=your_secure_secret_key

# Precompila los activos
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expone el puerto 3000
EXPOSE 3000

# Configura el comando de inicio
CMD ["rails", "server", "-b", "0.0.0.0"]