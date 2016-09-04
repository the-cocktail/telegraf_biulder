FROM golang
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ruby
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install rpm
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libffi-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install ruby-dev
RUN gem install fpm --no-ri --no-rdoc
COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
