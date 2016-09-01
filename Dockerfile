FROM debian

RUN apt-get update -y && apt-get install -y curl
# We need a current npm-version
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -y && apt-get install -y \
    nodejs \
    ruby \
    ruby-dev \
    libmysqlclient-dev \
    cmake \
    pkg-config \
    imagemagick \
    git \
    php5-dev \
    php5-cli \
    php-pear \
    php5-mysql \
    php5-curl \
    php5-imagick \
    php5-mcrypt \
    php5-mhash \
    php5-redis \
    php5-sqlite

RUN cd /usr/local/bin/ && curl https://getcomposer.org/installer | php && mv composer.phar composer

RUN gem install bundler
