from django.core.files.storage import default_storage
from django.core.files import File
from api.models import Producto
import os

def migrate_images():
    productos = Producto.objects.all()
    
    for producto in productos:
        # Si existe una imagen local
        if producto.productoImage and os.path.exists(producto.productoImage.path):
            # Abre el archivo local
            with open(producto.productoImage.path, 'rb') as f:
                # Nombre del archivo
                filename = os.path.basename(producto.productoImage.name)
                # Guarda en Cloudinary
                producto.productoImage.save(
                    filename,
                    File(f),
                    save=True
                )
            print(f"Migrada imagen de producto {producto.productoName}")