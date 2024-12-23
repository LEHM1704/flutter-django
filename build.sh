#!/usr/bin/env bash
# Exit on error
set -o errexit

# Modify this line as needed for your package manager (pip, poetry, etc.)
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate
# DJANGO_SUPERUSER_PASSWORD=$DJANGO_SUPERUSER_PASSWORD python manage.py createsuperuser --username "ADMIN" --email "luishuancas1704@gmial.com" --noinput

IMAGE_DIR="C:\Users\user\Desktop\PROYECTOS-DE VALOR\Flutter-django\media\images"

# Credenciales de Cloudinary
CLOUD_NAME="dgrtoh3hi"
API_KEY="137574469393983"
API_SECRET="GC51cJYazX2ghwxA4X9Rf9xyWO8"

# Función para subir una imagen
upload_image() {
    IMAGE_PATH=$1
    IMAGE_NAME=$(basename "$IMAGE_PATH")

    # Subir la imagen usando curl
    curl -X POST "https://api.cloudinary.com/v1_1/$CLOUD_NAME/image/upload" \
         -F "file=@$IMAGE_PATH" \
         -F "api_key=$API_KEY" \
         -F "timestamp=$(date +%s)" \
         -F "signature=$(echo -n "timestamp=$(date +%s)&api_key=$API_KEY&$API_SECRET" | sha256sum | awk '{print $1}')" \
         -F "upload_preset=YOUR_UPLOAD_PRESET"
}

# Subir todas las imágenes del directorio
for IMAGE in "$IMAGE_DIR"/*; do
    if [ -f "$IMAGE" ]; then
        echo "Subiendo imagen $IMAGE..."
        upload_image "$IMAGE"
    fi
done