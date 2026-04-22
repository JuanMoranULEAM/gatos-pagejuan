FROM nginx:alpine

# Crear directorios con permisos de escritura para OpenShift
RUN mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/run/nginx && \
    chmod -R 777 /var/cache/nginx && \
    chmod -R 777 /var/run/nginx && \
    chmod -R 755 /var/log/nginx

# Copiar configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar archivos HTML
COPY index.html /usr/share/nginx/html/

# Asegurar permisos correctos
RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 8080

USER nginx

CMD ["nginx", "-g", "daemon off;"]
