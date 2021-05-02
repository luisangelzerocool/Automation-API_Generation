#language: es
#author: Luis Angel Vanegas Martinez

Característica: descargar reporte del portal empresas
  Yo como usuario del sistema quiero descargar un reporte para
  luego leerlo e instruirme al respecto

  Antecedentes: ingresar al portal
    Dado que Luis ingresa al portal Empresas - Capital Inteligente

  @RunnerTags
  Escenario: descargar reporte
    Dado que Luis accede a la opción de Actualidad Economica y selecciona el reporte a descargar
    Cuando Luis da clic a la imagen de descarga
    Entonces Luis debería ver el reporte en una nueva ventana

