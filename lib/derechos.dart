import 'package:flutter/material.dart';

class derechos extends StatelessWidget {
  const derechos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la página anterior
          },
        ),
      ),
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar
      body: SingleChildScrollView( // Hacer la pantalla desplazable
        child: Stack(
          children: [
            // Imagen de fondo
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.jpg'), // Ruta de tu imagen
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height, // Asegura que ocupe toda la pantalla
            ),
            Center(
               child: SizedBox(
    height: 600, // Aquí defines la altura que deseas para el Container
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20), 
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      
             // Espacio desde la parte superior de la pantalla
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
                  children: [
                    // Título del Contenedor
                    Text(
                      'Derechos de Autor',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1, // Línea divisoria bajo el título
                    ),
                    const SizedBox(height: 10),
                    // Texto Justificado
                    SingleChildScrollView(
                      child: Text(
                        '1. Introducción a los Derechos de Autor en PWA'
'Las aplicaciones web progresivas (PWA) son aplicaciones que combinan las'
'características de una página web con funcionalidades de aplicaciones móviles,'
'permitiendo una experiencia de usuario avanzada. En el entorno digital actual,'
'proteger los derechos de autor se ha vuelto crucial para garantizar que el trabajo'
'intelectual y creativo de los desarrolladores esté resguardado de usos indebidos'
'o de copia sin permiso.'
'2. Protección del Código Fuente'
'En México, el código fuente está protegido por leyes de derechos de autor bajo la'
'Ley Federal del Derecho de Autor. El registro del código fuente no es obligatorio,'
'pero se recomienda para obtener una protección legal adicional en caso de'
'disputas. Los derechos de autor cubren la estructura, organización y contenido'
'del código, mientras que las patentes pueden cubrir innovaciones técnicas'
'específicas, aunque los requisitos para obtenerlas son más rigurosos.'
'3. Protección de Contenido Visual y Multimedia'
'Dentro de una PWA, los derechos de autor también se aplican a cualquier'
'contenido visual y multimedia como imágenes, videos, gráficos y audio. Es'
'esencial tener derechos o licencias para usar cualquier contenido que no haya'
'sido creado por el propio desarrollador. En México, el uso de contenido de terceros'
'sin permiso puede resultar en sanciones legales. Además, existen licencias como'
'Creative Commons que permiten el uso de contenido bajo ciertos términos'
'específicos.'
'4. Propiedad Intelectual y Marca Registrada'
'La propiedad intelectual de una PWA también incluye nombres, logos y otras'
'identidades visuales de la marca. El registro de estos elementos bajo una marca'
'registrada puede protegerlos de uso indebido por parte de competidores. En'
'México, el Instituto Mexicano de la Propiedad Industrial (IMPI) es el organismo'
'encargado del registro de marcas y propiedad intelectual.'
'5. Condiciones de Uso y Términos de Servicio'
'Las condiciones de uso y términos de servicio son documentos legales'
'importantes para cualquier PWA, ya que definen las condiciones bajo las cuales'
'los usuarios pueden interactuar con la aplicación. Estos términos pueden aclarar'
'la titularidad de los derechos de autor y establecer limitaciones sobre el uso de la'
'aplicación, protegiendo tanto a los creadores como a los usuarios finales.'
'6. Recomendaciones Legales y de Protección'
'Para proteger adecuadamente la propiedad intelectual en una PWA, se'
'recomienda registrar el código y contenido visual ante las autoridades'
'correspondientes, y adoptar medidas adicionales de protección, como el uso de'
'contratos de confidencialidad y licencias. Existen servicios en línea y herramientas'
'que facilitan el proceso de registro y vigilancia de los derechos de autor, ayudando'
'a los creadores a resguardar su trabajo de forma efectiva'
                       
                        
                                     
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}