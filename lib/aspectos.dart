import 'package:flutter/material.dart';

class aspectos extends StatelessWidget {
  const aspectos({Key? key}) : super(key: key);

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
                      'Aspectos Legales',
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
'1. Protección de Datos Personales:'
'• Regulación: Dependiendo de la región en la que opere la red social, deberá cumplir con'
'regulaciones de privacidad, como el Reglamento General de Protección de Datos (GDPR) en la'
'Unión Europea o la Ley de Protección de la Privacidad en Línea de los Niños (COPPA) en EE. UU.'
'• Consentimiento: Es importante obtener el consentimiento explícito de los usuarios para la'
'recolección y procesamiento de sus datos personales.'
'• Derechos de los usuarios: Los usuarios deben poder acceder, corregir, eliminar o restringir el uso'
'de sus datos personales.'
'2. Términos y Condiciones:'
'• Política de Uso: Deben existir términos de uso claros que especifiquen las reglas para los'
'usuarios, incluyendo lo que se considera comportamiento aceptable o no.'
'• Propiedad de contenido: Los términos deben aclarar la propiedad de los contenidos que los'
'usuarios suben, si el usuario conserva los derechos o si la red social obtiene algún tipo de'
'licencia sobre ese contenido.'
'• Limitaciones de responsabilidad: Es recomendable que la red social exima de responsabilidad'
'en caso de que los usuarios violen las leyes con el contenido publicado.'
'3. Propiedad Intelectual:'
'• Derechos de autor: Es importante que la red social tenga políticas claras para abordar las'
'infracciones de derechos de autor, como las notificadas por la Ley de Derechos de Autor en Línea'
'(DMCA) en EE. UU.'
'• Marcas registradas: La red social debe asegurarse de no infringir marcas registradas de terceros,'
'y también debe proteger su propia marca.'
'4. Moderación de Contenido:'
'• Reglas de moderación: La red social debe establecer mecanismos de moderación de contenido'
'para prevenir el discurso de odio, la violencia, la difamación y otras actividades ilegales.'
'• Responsabilidad por el contenido generado por usuarios: Dependiendo de la jurisdicción, las'
'redes sociales pueden ser responsables del contenido publicado por los usuarios, pero en'
'algunos casos pueden tener inmunidad si cumplen con ciertas obligaciones de moderación (por'
'ejemplo, el Acta de Decencia en las Comunicaciones en EE. UU.).'
'5. Publicidad y Marketing:'
'• Publicidad dirigida: Si la red social ofrece publicidad dirigida o personalizada, debe cumplir con'
'las leyes de publicidad y privacidad, como obtener el consentimiento de los usuarios para la'
'recolección de datos utilizados para la segmentación.'
'• Transparencia: Las redes sociales deben ser transparentes en cuanto a cómo usan los datos para'
'fines publicitarios y comerciales.'
'6. Licencias y permisos:'
'• Licencias para usar software: Si se utilizan aplicaciones o tecnologías de terceros, se deben'
'gestionar las licencias adecuadas para evitar problemas legales.'
'• Permisos de menores: Si la red social permite el acceso a menores de edad, deberá contar con'
'permisos de los padres o tutores, según sea necesario.'
'7. Transparencia y Cumplimiento:'
'• Política de privacidad: Debe existir una política de privacidad accesible que explique cómo se'
'recopilan, utilizan, protegen y almacenan los datos de los usuarios.'
'• Cumplimiento de la ley local: La red social debe cumplir con las leyes del país donde opera, lo'
'cual puede implicar adaptar los términos, condiciones y políticas de privacidad.'
                       
                        
                                     
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