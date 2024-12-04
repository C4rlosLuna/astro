import 'package:astro/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AstroApp());
}

class AstroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiPantalla(),
    );
  }
}

class MiPantalla extends StatefulWidget {
  @override
  _MiPantallaState createState() => _MiPantallaState();
}

class _MiPantallaState extends State<MiPantalla> {
  final List<String> textos = [
    "Deja volar tu creatividad con nuestro catálogo de beats.",
    "Paquetes astronómicos para llevar tu música a otro universo.",
    "Masterización, ecualización, producción, instrumentalización y más. ",
  ];
  int _textoActual = 0;
  Timer? _temporizador;

  @override
  void initState() {
    super.initState();
    _iniciarCicloTexto();
  }

  @override
  void dispose() {
    _temporizador?.cancel();
    super.dispose();
  }

  void _iniciarCicloTexto() {
    _temporizador = Timer.periodic(Duration(seconds: 8), (timer) {
      setState(() {
        _textoActual = (_textoActual + 1) % textos.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenedor que organiza todo en una columna
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centra los elementos horizontalmente
            children: [
              // Imagen centrada en la parte superior
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/principal.gif', // Ruta de la imagen
                    width: 400, // Ajusta el tamaño de la imagen si es necesario
                  ),
                ),
              ),
              // Espacio entre la imagen y el texto
              SizedBox(height: 2),

              // Texto centrado
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  textos[_textoActual],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                  textAlign: TextAlign.center, // Alinea el texto al centro
                ),
              ),

              // Espacio entre el texto y el botón
              SizedBox(height: 10),

              // Botón debajo del texto
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0), // Espacio entre el texto y el botón
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  },
                  child: Text("Comenzar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
