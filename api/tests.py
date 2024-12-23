from django.test import TestCase

# Create your tests here.
from cloudinary.uploader import upload
from cloudinary.utils import cloudinary_url

# Sube una imagen local (asegúrate de tener una imagen en tu servidor o usa una URL directa)
response = upload(r"C:\Users\user\Desktop\PROYECTOS-DE VALOR\Flutter-django\media\images\puslera-plata_dtzEjXT_BEbBmJm.jpg")
  # Cambia por una ruta válida o URL

# Muestra la URL pública de la imagen subida
print("URL pública:", response['url'])

# Verifica si se puede generar una URL segura para la imagen subida
print("URL segura:", cloudinary_url(response['public_id'])[0])
