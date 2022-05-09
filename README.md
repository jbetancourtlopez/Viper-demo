## Photos App
App demo que consume la api de splash la cual realiza una busqueda con paginación en arquitectura Viper.

<p align="center">
<img style="display: inline-block;"  src='https://i.imgur.com/67HulEp.png' width='33%'/>
<img style="display: inline-block;" src='https://i.imgur.com/ZAdV2XD.png' width='33%'/>
</p>


## Goals
* OK - 100% Swift
* OK - VIPER
* OK - Paginado
* OK - Listado de infomación con TableView en el Storyboard.
* OK - Buscador.
* OK - Guardado de img en caché con NSCache
* OK - Llamada Api’s con URLSession.


## Mejoras
* Prefetch de data... creare una branch para implentar esto.

## Nota
Se agrego Alamofire y Kingfisher pero no se uso, se opto por hacerlo nativo.


## Arquitectura
<img src="https://i.imgur.com/QU9ijpC.png" title="source: imgur.com" />

## Distribución de carpetas

```
├── View                     # ViewControllers
|
├── Interator                # Capa de trae la la informacion en un Entity de vista desde local o remoto
│   ├── local                # Persistencia de datos
|   │   ├── dao              # Acceso a datos local
|   |   ├── entities         # Entidades local
|   |   ├── mappers          # Transformacion de entidades local a entidades del vista
│   ├── remote               # Datos remotos
|   |   ├── mapper           # Transformacion de entidades remoto a entidades del vista
|   |   ├── entities         # Entidades de remote
|   |   ├── service          # Invocacion de los servicios de la Api
|
├── Presenter                # Intermediario de la view con el interator
|
├── Entity                   # Entidades del proyecto/vista que recuperar el interator
|
├── Router                   # Clase encargada de la navegación de nuestra app
|
├── protocols                # Protocolos por modulo en cada capa V.I.P.E.R.
|
├── core                     # Guardo clases en general que no tiene que ver con VIPER 
│   ├── cells                # Cells de los tableview
│   ├── extencios            # Extenciones de clases 
│   └── resources            # Recursos multimedia
│   └── utils          	     # General


```


