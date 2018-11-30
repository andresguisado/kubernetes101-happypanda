FROM nginx:latest
USER root
ADD src /usr/share/nginx/html/
RUN touch /tmp/ready