import 'package:astro/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Configuraciones());
}

class Configuraciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Configuraciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: PantallaConfiguraciones(),
    );
  }

  static of(BuildContext context) {}
}

class PantallaConfiguraciones extends StatefulWidget {
  @override
  _PantallaConfiguracionesState createState() =>
      _PantallaConfiguracionesState();
}

class _PantallaConfiguracionesState extends State<PantallaConfiguraciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => home()));
          },
        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover, // Asegura que la imagen cubra toda la pantalla
            ),
          ),
          // Contenido principal
          ListView(
            children: <Widget>[
              Divider(),
              ListTile(
                title: Text(
                  'Acerca de',
                  style: TextStyle(
                      color: Colors.white), // Cambiar color del texto a blanco
                ),
                subtitle: Text(
                  'Más información sobre la aplicación',
                  style: TextStyle(
                      color: Colors.white), // Cambiar color del texto a blanco
                ),
                onTap: () {
                  _mostrarDialogoAcercaDe();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoIdioma() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar idioma'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Español'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Inglés'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _mostrarDialogoAcercaDe() {
    showAboutDialog(
      context: context,
      applicationName: 'Artistas Emergentes Tlaxcala',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.music_note),
      children: <Widget>[
        Text(
          'Esta aplicación permite conocer, escuchar y contratar artistas emergentes de Tlaxcala.',
          style: TextStyle(
              color: Colors.white), // Cambiar color del texto a blanco
        ),
        Text('Licencia:', style: TextStyle(color: Colors.white)),
        Text(
          'Apache License 2.0, consulte https://www.apache.org/licenses/LICENSE-2.0',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
