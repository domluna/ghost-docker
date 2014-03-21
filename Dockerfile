FROM dockerfile/nodejs
MAINTAINER Dominique Luna <dluna132@gmail.com>

RUN apt-get update

# Make dir for ghost files
RUN mkdir -p /ghost

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get install -y nginx

# Install Ghost
RUN cd /ghost && wget https://ghost.org/zip/ghost-0.4.1.zip -O ghost.zip
RUN cd /ghost && unzip ghost.zip && rm -f ghost.zip
RUN cd /ghost && npm install --production
RUN cp /ghost/config.example.js /ghost/config.js

# Install forever package globally
RUN npm install -g forever

# Mount volumes
VOLUME /ghost-custom

# Working directory
WORKDIR /ghost

# Expose port for nginx
EXPOSE 80

# Remove default nginx config
RUN rm -v /etc/nginx/nginx.conf

# Add sample config file for nginx
ADD nginx.conf /etc/nginx/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf


# Add shell script
ADD deploy.bash /ghost-start

# Set the node env to production
ENV NODE_ENV production

# Run cmd
CMD ["bash", "/ghost-start"]
