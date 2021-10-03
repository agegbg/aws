#!/bin/bash

# check if run as root
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

<p>Grattis. Ser du denna sida så är det installerat och klart. <p>

<p style="color:lightsalmon;background-color:darkslategray;padding: .5em;">Life is trying things to see if they work. -Ray Bradbury</p>
</body>
</html>' > /var/www/html/index.html

# start server
systemctl start nginx