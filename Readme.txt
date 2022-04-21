Data:
Services->TiendaPelicula: contiene las declaración correspondientes para el consumo del servicio(web service)
Services->ServicioPelicula: retorna la información consumida por el servicio clasificada en cada una de las categorías.
Model:
Models->Pelicula: contiene cada uno de los atributos retornados por el servicio(web service)
Bindings->BuscarPeliculas: Esta clase busca o lista las películas según el criterio de los filtros enviados.
Bussines:
Bindings->CargarImagenes: Esta clase trae la imagen y la almacena en cache para mejorar los tiempos de respuesta.
Bindings->DetallePelicula: Esta clase trae toda la información detallada de la película.
Bindings->ListaPelicula: Esta clase lista las películas, con algunas caracteristicas.
View: 
View->BuscarPeliculaView: contiene el serachbarview para la búsqueda de películas.
View->PeliculaListaView: Contiene la presentación de las caratulas de las películas en las 4 categorias, agrupando las otras vistas
View->PeliculaDetalleView: contiene la información detallada de la película, tales como trailers, sinopsis, etc.
View->PeliculaFondoTarjetaView: contiene el diseño de la caratula de la película de fondo.
View->PeliculaFondoCarruselView: contiene el diseño de la caratula de la película de fondo dentro del carrusel.
View->PeliculaPosterTarjetaView: Contiene la el diseño de la caratula de la película para mostrar.
View->PeliculaPosterCarruselView: Contiene la el diseño de la caratula de la película para mostrar dentro del carrusel.
Principio de Responsabilidad Única: básicamente hace referencia a UN OBJETO DEBE REALIZAR UNA UNICA COSA.
Buenas Prácticas (Buen Codigo):
-Entendible
-Extensible
-Reusable
-Estructurado
