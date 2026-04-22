# Felino — Curiosidades & Razas

Aplicación web estática con información sobre felinos, curiosidades y razas.

## Descripción

Sitio web responsivo desarrollado en HTML y CSS, con un diseño moderno y elegante.

## Tecnologías

- HTML5
- CSS3
- JavaScript (si aplica)

## Deployment en OpenShift Sandbox

### Requisitos

- Cuenta en [OpenShift Sandbox](https://developers.redhat.com/sandbox)
- CLI de OpenShift (`oc`)
- Docker (opcional, para pruebas locales)

### Pasos para desplegar

1. **Crear un proyecto en OpenShift Sandbox**
   ```bash
   oc new-project felino-app
   ```

2. **Opción A: Desplegar desde esta carpeta directamente**
   ```bash
   oc new-app . --name felino-web
   ```

3. **Opción B: Desplegar desde Dockerfile**
   ```bash
   oc new-build --binary --name felino-build -f Dockerfile
   oc start-build felino-build --from-dir=.
   oc new-app felino-build
   ```

4. **Exponer la aplicación**
   ```bash
   oc expose service felino-web
   ```

5. **Obtener la URL pública**
   ```bash
   oc get route
   ```

### Verificar el despliegue

```bash
oc logs dc/felino-web
oc get pods
```

## Desarrollo local

Para probar localmente con Docker:

```bash
docker build -t felino-web .
docker run -p 8080:8080 felino-web
```

Luego abre `http://localhost:8080` en tu navegador.

## Archivos principales

- `index.html` - Archivo principal de la aplicación
- `Dockerfile` - Configuración para containerizar la app
- `.dockerignore` - Archivos a excluir en la imagen Docker
