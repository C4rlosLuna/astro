
import 'package:astro/PDFViewer.dart';
import 'package:astro/aspectos.dart';
import 'package:astro/configuraciones.dart';
import 'package:astro/derechos.dart';
import 'package:astro/iniciodesesion.dart';
import 'package:astro/modelado.dart';
import 'package:astro/paquetes.dart';
import 'package:flutter/material.dart';
import 'CatalogScreen.dart';
void main() => runApp(home());

final List<Map<String, String>> tarjetasData = [
  {
    'title': 'Astro Paquetes',
    'image': 'assets/astro1.gif', // GIF o imagen para la tarjeta 1
    'description': 'Conoce nuestros paquetes.',
  },
  {
    'title': 'Catálogo de beats.',
    'image': 'assets/astro2.gif', // GIF o imagen para la tarjeta 1
    'description': 'Conoce nuestros beats.',
  },
];

class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/fondo.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.15,
                              bottom: MediaQuery.of(context).size.height * 0.30,
                              child: Text(
                                'Astronomicamente Asombroso',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      right: MediaQuery.of(context).size.width * 0.0,
                      child: Builder(
                        builder: (context) {
                          // Usamos MediaQuery para obtener el ancho de la pantalla
                          double screenWidth =
                              MediaQuery.of(context).size.width;

                          // Establecemos el umbral para esconder la imagen, por ejemplo, 600 píxeles
                          bool showImage = screenWidth > 600;

                          return Visibility(
                            visible: showImage,
                            child: Image.asset(
                              'assets/AstroAnimacion.gif',
                              width: 600, // Ancho fijo de la imagen
                            ),
                          );
                        },
                      ),
                    ),

                    // Header
                    Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.home,
                                      color: Colors.white, size: 35),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  },
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.settings,
                                          color: Colors.white, size: 35),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Configuraciones()));
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.dashboard,
                                          color: Colors.white, size: 35),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),

                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.15,
                      top: MediaQuery.of(context).padding.top +
                          MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        'assets/logotipografico.png',
                        width: 350,
                        height: 350,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 700,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/fondo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 300,
                          width: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/principal.gif'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sobre Nosotros',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Pacifico-Regular'),
                            ),
                            SizedBox(height: 35),
                            Text(
                              'Somos un equipo de creativos apasionados por la música y la producción. '
                              'Nuestro objetivo es ofrecer herramientas y recursos para que artistas y productores '
                              'puedan llevar su música al siguiente nivel. Trabajamos con los mejores profesionales para '
                              'garantizar calidad y dedicación en cada proyecto.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1.5,
                                  fontFamily: 'Ubuntu-Regular'),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/fondo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: const Color.fromARGB(226, 0, 0, 0),
                ),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Center(
                        child: Text(
                          'Nuestros Servicios',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: List.generate(tarjetasData.length, (index) {
                            final tarjeta = tarjetasData[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      title: tarjeta['title'] ?? '',
                                    ),
                                  ),
                                );
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: constraints.maxWidth < 600
                                    ? constraints.maxWidth
                                    : (constraints.maxWidth / 2) - 16,
                                height: 500,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 245, 245),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 141, 13, 103)
                                          .withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        tarjeta['image'] ??
                                            'assets/placeholder.gif',
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      tarjeta['title'] ??
                                          'Título predeterminado',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Pacifico-Regular',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      tarjeta['description'] ??
                                          'Descripción predeterminada.',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 650,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/fondo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.0001,
                      top: MediaQuery.of(context).size.width * 0.05,
                      child: Image.asset(
                        'assets/ConoceA.png',
                        width: 500,
                        height: 500,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Modelado()));
                        },
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Experiencia Astro',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajusta la imagen para que cubra toda la pantalla
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/lumamoma.png', // Ruta de la imagen (logo u otra imagen)
              width: 300,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Separación lateral
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Textos separados
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna izquierda
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CustomScreen()),
                          );
                        },
                        child: Text(
                          'Politica de Privacidad',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Ubuntu-Regular',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Espaciado entre textos
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => derechos()),
                          );
                        },
                        child: Text(
                          'Derechos de Autor',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Ubuntu-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Columna derecha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => aspectos()),
                          );
                        },
                        child: Text(
                          'Aspectos Legales',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Ubuntu-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
           
      const SizedBox(height: 40),
      Text(
        '© 2024 Lumamoma',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontFamily: 'Pacifico-Regular',
        ),
      ),
    ],
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  final List<String> titles = [
    "Nuestros Paquetes",
    "Catálogo de beats.",
  ];
  final List<String> descriptions = [
    "Publicaciones para redes sociales, beats, masterización y más.",
    "Escucha nuestro catálogo de beats con los cuales podrás crear tu propia música.",
  ];
  final List<String> imagePaths = [
    "assets/AstroPaquetes.gif",
    "assets/AstroBeats.gif",
  ];

  DetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage(imagePaths[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Pacifico-Regular'),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    descriptions[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Ubuntu-Regular'),
                                  ),
                                  SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (index == 0) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Paquetes(),
                                            ),
                                          );
                                        } else if (index == 1) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CatalogScreen(),
                                              ));
                                        }
                                      },
                                      child: Text('Ver más'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
