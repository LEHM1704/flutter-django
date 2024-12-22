from django.contrib import admin
from api.models import Producto, Client, Venta, VentaProducto


admin.site.register(Producto)
admin.site.register(Client)
admin.site.register(Venta)
admin.site.register(VentaProducto)

