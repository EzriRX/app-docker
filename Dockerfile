FROM ruby:3.1-slim-bullseye

# Install dependencies
RUN apt update && apt install -y build-essential software-properties-common git g++ qtbase5-dev qt5-qmake qtbase5-dev-tools libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x nano curl libcurl4 libcurl4-openssl-dev ca-certificates gnupg libmagickcore-dev libmagickwand-dev imagemagick xvfb libmariadb-dev default-mysql-client

# Install NodeJs
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt update && apt install -y nodejs

RUN npm install --global yarn

RUN gem install bundler -v 2.2.33

ENV NODE_OPTIONS="--max-old-space-size=1536"