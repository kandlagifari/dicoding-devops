# Pull base image Ubuntu version 20.04
FROM ubuntu:20.04

# # Change to local repository
# # No route to buaya.klas.or.id repo
# ADD sources.list /etc/apt/sources.list 

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

# Copy index.html
COPY index.html /var/www/html/

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server, option `-g daemon off` will run NGINX on foreground
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
