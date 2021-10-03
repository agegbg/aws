#!/bin/bash

# check if root
if(( $EUID!=0)); then
    echo "Script must be run as root. Exiting..."
    exit
fi

# install apache
apt update -y
apt install nginx -y

# change default website
echo '<html>
<head>
<title>Markus Agebrink</title>
</head>
<body>
<h1>Markus Agebrink</h1>

<p>Grattis Det fungerar . <p>

</body>
</html>' > /var/www/html/index.html

# start server
systemctl start nginx
