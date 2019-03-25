# Apache, PHP and extensions

Docker - PHP:APACHE:LATEST with extensions

---

### Introduction:

Installation apache2, php with extensions

#### List ext:
```
gd
ldap
imap
opcache
xmlrpc
mysqli
apc
cas
```

### CLI

Download images

```
docker pull djenko/httpd-php-ext
```

### To load

```
docker run --rm -name apache-php -p 80:80 -d djenko/httpd-php-ext
```
### To load with volumes

```
docker run --rm -name apache-php -v /yourdata:/etc/apache2/sites-available/ -p 80:80 -d djenko/httpd-php-ext
```

In folder yourdata put your file conf (exemple:000-default.conf)

```
<VirtualHost *:80>

        DocumentRoot /var/www/mywebsite

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```
