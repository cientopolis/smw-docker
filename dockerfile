FROM mediawiki

# install missung stuff and php extensions
RUN apt-get update && apt-get install -y \
      vim \
      nano \
      yarn \
      unzip \
      wget \
      libzip-dev \
    && docker-php-ext-install zip

# install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# install page forms
RUN wget https://github.com/wikimedia/mediawiki-extensions-PageForms/archive/4.9.5.zip
RUN unzip 4.9.5.zip
RUN mv mediawiki-extensions-PageForms-4.9.5/ ./extensions/PageForms
    
# update mediawiki extensions via composer
COPY composer.local.json .
RUN composer update --no-dev
