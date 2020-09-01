# smw-docker
Configuración de docker para tener una SMW con Page form y algún otro plugin para cursos de TWSS


# Semantic MediaWiki

Crea e inicia una imagen de Docker que contiene Semantic Mediawiki


## Paso 1: Obtener MediaWiki y configurarla

El proposito de este paso es configurar MediaWiki, generar el archivo de configuracion LocalSettings.php y tener la MediaWiki funcionando:

* Disparar el build inicial e inicializar la imagen:

  ```
  :> docker-compose up -d
  ```

* Configure MediaWiki a traves de su configurador web en http://localhost:8081

  _Nota:_ asegúrese de seleccionar **SQLite** como tipo de base de datos!

* Descargue y guarde en este mismo directorio el archivo `LocalSettings.php` que generó con el configurador.

* Pare la ejecucion del container docker con el siguiente comando

  ```
  :> docker-compose down
  ```

* Abra el archivo `docker-compose.yaml`, y quite el comentario a la linea donde se monta el archivo `LocalSettings.php`, y luego guarde los cambios del archivo.

* Testee laa wiki (ahora con la configuración que hizo y quedó guardada en el archivo `LocalSettings.php`)

  ```
  :> docker-compose up -d
  ```


## Paso 2: Activar Semantic MediaWiki y PageForms

Esta sección simplifica y sigue los pasos de instalacion de Semantic Mediawiki.

* Pare la ejecución del container

  ```
  :> docker-compose stop
  ```

* Agrugue al final del archivo `LocalSettings.php` las siguientes linea:

  ```
  enableSemantics("taller");
  wfLoadExtension( 'PageForms' );
  ```
  _Nota:_ el valor entre comillsa de la instruccion enableSemantics() debe ser el nombre que eligió para su wiki. Si queda vacío no deberia ser un problema. 
  
* Inicie la Semantic MediaWiki que ha configurado

  ```
  :> docker-compose start
  ```

* Ejecute `update.php`
 
  ```
  :> docker-compose exec smwpf php maintenance/update.php
  ```  

* Testee su SMW  en http://localhost:8081
    

[1]: https://www.semantic-mediawiki.org
[2]: https://www.semantic-mediawiki.org/wiki/Help:Installation/Quick_guide
[3]: https://www.semantic-mediawiki.org/w/index.php?title=Help:EnableSemantics
