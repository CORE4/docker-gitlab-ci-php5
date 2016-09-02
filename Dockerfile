FROM debian:jessie

# The nodejs version from debian is outdated
RUN apt-get update -y && apt-get install -y curl locales
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

# Switch to Europe/Berlin
RUN ln --force --symbolic "/usr/share/zoneinfo/Europe/Berlin" "/etc/localtime"
RUN dpkg-reconfigure --frontend=noninteractive tzdata

# Switch to UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

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
