FROM nginx:1.18-alpine
RUN cd etc/nginx/conf.d && rm -r default.conf && mkdir sites-available sites-enabled
COPY portfolio.conf /etc/nginx/conf.d/sites-available
COPY chat.conf /etc/nginx/conf.d/sites-available
COPY webstore.conf /etc/nginx/conf.d/sites-available
COPY music.conf /etc/nginx/conf.d/sites-available
RUN cd etc/nginx/conf.d/sites-enabled && ln -s ../sites-available/portfolio.conf . && ln -s ../sites-available/chat.conf . && ln -s ../sites-available/webstore.conf . && ln -s ../sites-available/music.conf .
RUN cd etc/nginx && rm -r nginx.conf
COPY ./nginx.conf /etc/nginx
CMD ["nginx", "-g", "daemon off;"]