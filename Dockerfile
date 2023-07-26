FROM cimg/ruby:3.0.6

RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

RUN sudo apt-get update --allow-releaseinfo-change && sudo apt-get install -y g++ qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x nano libcurl4 libcurl4-openssl-dev libmagickcore-dev libmagickwand-dev imagemagick xvfb nodejs default-mysql-client

RUN sudo npm install --global yarn

RUN gem install bundler -v 2.2.33

ENV NODE_OPTIONS="--max-old-space-size=512"