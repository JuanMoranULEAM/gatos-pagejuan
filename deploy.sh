#!/bin/bash
# Script para desplegar en OpenShift Sandbox

set -e

PROJECT_NAME="felino-app"
APP_NAME="felino-web"

echo "🚀 Iniciando despliegue en OpenShift Sandbox..."
echo ""

# Crear proyecto si no existe
echo "📦 Creando proyecto..."
oc new-project $PROJECT_NAME 2>/dev/null || oc project $PROJECT_NAME

# Construir imagen
echo "🔨 Construyendo imagen Docker..."
oc new-build --binary --name $APP_NAME -f Dockerfile 2>/dev/null || echo "Build config ya existe"
oc start-build $APP_NAME --from-dir=. --wait

# Desplegar aplicación
echo "⚙️  Desplegando aplicación..."
oc new-app $APP_NAME 2>/dev/null || oc rollout latest dc/$APP_NAME

# Exponer servicio
echo "🌐 Exponiendo servicio..."
oc expose service $APP_NAME 2>/dev/null || echo "Route ya existe"

# Esperar a que esté disponible
echo "⏳ Esperando a que la aplicación esté lista..."
oc rollout status dc/$APP_NAME

# Mostrar información
echo ""
echo "✅ ¡Despliegue completado!"
echo ""
oc get route $APP_NAME
