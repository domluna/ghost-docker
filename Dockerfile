FROM dockerfile/nodejs
MAINTAINER Dominique Luna <dluna132@gmail.com>

RUN apt-get update

# Make dir for ghost files
RUN mkdir -p /ghost

WORKDIR /ghost

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get install -y nginx

# Remove default nginx config
RUN rm -v /etc/nginx/nginx.conf

# Add sample config file for nginx
ADD nginx.conf /etc/nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Install Ghost
RUN cd /ghost && wget https://ghost.org/zip/ghost-0.4.1.zip -O ghost.zip
RUN cd /ghost && unzip ghost.zip && rm -f ghost.zip
RUN cd /ghost && npm install --production

# Install forever package globally
RUN npm install -g forever

# Expose port for nginx
EXPOSE 80

# Add shell script
ADD deploy.bash /ghost-start

# Run cmd
CMD ["bash", "/ghost-start"]
