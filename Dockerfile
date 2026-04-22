# Usar imagen base de Nginx para servir archivos estáticos
FROM nginx:latest

# Copiar archivos HTML a la carpeta de Nginx
COPY index.html /usr/share/nginx/html/

# Exponer puerto 8080 (requerido por OpenShift)
EXPOSE 8080

# Configurar Nginx para escuchar en puerto 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf
