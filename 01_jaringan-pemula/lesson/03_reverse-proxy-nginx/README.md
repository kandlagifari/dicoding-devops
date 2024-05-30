# Install Nginx
```shell
sudo apt update
sudo apt-get install nginx -y
```

# Check Nginx status
```shell
sudo systemctl status nginx
```

# Configure Nginx as Reverse Proxy
By default, nginx configuration file is stored in `/etc/nginx/sites-available/default` </br>

We can edit the file using vi or any text editor </br>
```shell
sudo vi /etc/nginx/sites-available/default
```

Add this code block on the default nginx configuration file
```conf
location / {
    proxy_pass http://localhost:8000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
 
    # …
}
```

Remove this code (in `location/` block)
```conf
# First attempt to serve request as file, then
# as directory, then fall back to displaying a 404.
try_files $uri $uri/ =404;
```

