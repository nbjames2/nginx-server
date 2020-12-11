FROM nginx:1.18-alpine
RUN cd etc/nginx/conf.d && rm -r default.conf && mkdir sites-available sites-enabled
COPY projects.conf /etc/nginx/conf.d/sites-available
RUN cd etc/nginx/conf.d/sites-enabled && ln -s ../sites-available/projects.conf .
RUN cd etc/nginx && rm -r nginx.conf
COPY ./nginx.conf /etc/nginx
CMD ["nginx", "-g", "daemon off;"]