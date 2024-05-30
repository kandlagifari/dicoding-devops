# Install Certbot for Nginx
```shell
sudo apt-get update
sudo apt-get install python3-certbot-nginx -y
```

# Create TLS Certificate
```shell
sudo certbot --nginx -d <yourdomain.com> -d <www.yourdomain.com>
```

On the certificate process creation, we need to fill several questions.
- Email => use our valid email address, because we will received notification in case TLS cert is expired
- Terms of Service => A (Agree)
- Would you be willing to share your email address => N (No)
- Please choose whether or not to redirect HTTP traffic to HTTPS => 2 (Redirect)

After that, TLS certificate will be installed on our subdomain </br>

We can also read the important notes which given by Certbot
