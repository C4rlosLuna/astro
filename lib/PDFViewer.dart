import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key}) : super(key: key);

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
                      'Política de privacidad y protección de datos de carácter personal según ASTRO PRODUCTIONS',
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
                        'ASTRO PRODUCTIONS, en la aplicación de la normativa vigente en materia de'
                        'protección de datos de carácter personal informa que los datos de protección de datos de'
                        'carácter personal, informa que los datos personales que recogen a través de los'
                        'formularios de la aplicación web progresiva: ASTRO PRODUCTIONS, se incluyen en los'
                        'ficheros automatizados de usuarios de los servicios de ASTRO PRODUCTIONS.'
                        '(www.astro.com)'
                        'A. Introducción'
                        '1. La privacidad de nuestro sitio web es muy importante para usted, nosotros'
                        'estamos comprometidos para salvaguardarlo. Esta política de privacidad explica lo'
                        'que hacemos con su información personal.'
                        '2. Al dar su consentimiento a nuestro uso de cookies de acuerdo con los términos de'
                        'esta política cuando visita nuestra app por primera vez, nos permite utilizar cookies'
                        'cada vez que visite nuestra app.'
                        'B. Crédito'
                        '1. Este documento fue creado usando de SEQ legal y modificada por ASTRO'
                        'PRODUCTIONS.'
                        'C. Como recolectamos datos personales'
                        'Los siguientes tipos de información personal puede ser recolectada, almacenada y'
                        'usada:'
                        '1. Información sobre su computadora incluyendo su dirección IP, ubicación'
                        'geográfica, tipo de navegador y versión, y sistema operativo.'
                        '2. Información sobre sus visitas para el uso de este sitio web incluido la fuente'
                        'de referencia, longitud de visita, vistas de la página, y navegación de la'
                        'aplicación.'
                        '3. Información que usted registra en nuestra aplicación, como su correo'
                        'electrónico en la app.'
                        '4. Información que usted ingresa cuando crea una cuenta en nuestra'
                        'aplicación. Por ejemplo, nombre, fotos de perfil, genero, fecha de'
                        'nacimiento, intereses, categorías y detalles laborales.'
                        '5. Información que usted publique con la intención de ser publicada en'
                        'internet.'
                        '6. Información que usted ingresa para configurar la suscripción a nuestros'
                        'correos electrónicos y boletines informativos.'
                        '7. Alguna otra información personal que envíes a nosotros.'
                        'La recogida y tratamiento automatizado de datos de carácter personal tiene como'
                        'finalidad mantenimiento de la relación comercial y el desempeño de tareas de'
                        'información, formación, asesoramiento y otras actividades propias de ASTRO'
                        'PRODUCTIONS.'
                        'D. Uso de información personal'
                        'La información personal que nos envié a través de nuestro sitio web se utilizara para los'
                        'fines especificados en esta política o en las páginas correspondientes de nuestra'
                        'aplicación. Nosotros podemos usar su información personal de la siguiente manera.'
                        '1. Administrando nuestra aplicación y negocios.'
                        '2. Personalizando nuestra aplicación para usted.'
                        '3. Habilitando su uso de servicios disponibles de nuestra aplicación web progresiva.'
                        '4. Usando sus datos para informes y análisis de datos.'
                        '5. Permitir el uso de los servicios disponibles en nuestra app.'
                        '6. Presentación se servicios adquiridos a través de nuestra aplicación.'
                        '7. Proporcionar a terceros información estadística sobre nuestros usuarios.'
                        '8. Tratar las consultas y quejas realizadas por usted o sobre usted en relación con'
                        'nuestra aplicación.'
                        '9. Mantener nuestra aplicación web segura y confiable.'
                        '10. Dando nuevas mejoras a la aplicación.'
                        '11. Otros usos.'
                        'Si envías tu información personal para publicar en nuestra aplicación, nosotros será'
                        'publicada y de otro modo usar esa información en conformidad con la licencia de su'
                        'supervisión.'
                        'E. Divulgación de información personal'
                        'Podemos divulgar su información personal a cualquiera de nuestros empleados, oficiales,'
                        'aseguradoras, asesores profesionales, agentes, proveedores o subcontratistas según sea'
                        'razonablemente necesario para los fines establecidos en esta política.'
                        'También podemos divulgar su información personal a cualquier miembro de nuestro grupo'
                        'de empresas (esto incluye nuestras subsidiarias, nuestra empresa matriz y todas sus'
                        'subsidiarias) según sea razonablemente necesario para los fines establecidos en esta'
                        'política.'
                        'Podemos divulgar su información personal:'
                        '1. En la medida en que estemos obligados a hacerlo por ley.'
                        '2. En relación con cualquier procedimiento legal en curso o potencial.'
                        '3. Para establecer, ejercer o defender nuestros derechos legales (incluyendo'
                        'proporcionar información a otros para fines de prevención de fraudes y'
                        'reducción de riesgos crediticios).'
                        '4. Al comprador (o posible comprador) de cualquier negocio o activo que estemos'
                        '(o estemos contemplando) vendiendo.'
                        '5. A cualquier persona que creamos razonablemente que pueda solicitar a un'
                        'tribunal o autoridad competente la divulgación de esa información personal'
                        'cuando, en nuestra opinión razonable, dicho tribunal o autoridad'
                        'probablemente ordenaría la divulgación de esa información personal.'
                       
                        
                                     
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


