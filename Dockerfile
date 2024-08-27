FROM busybox:latest
ENV PORT=8000
LABEL maintainer="Camila Leite <milla@apprendendo.blog>"

ADD index.html ./public/index.html

# EXPOSE $PORT

HEALTHCHECK CMD nc -z localhost $PORT

# Create a basic webserver and run it until the container is stopped
CMD echo "httpd started" && trap "exit 0;" TERM INT; httpd -v -p $PORT -h /www -f & wait

LABEL Name=dockercnw Version=0.0.5
