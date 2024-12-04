import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const Modelado());

class Modelado extends StatelessWidget {
  const Modelado({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 24, 24, 24),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),color: Color.fromARGB(255, 245, 245, 245),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/fondo.jpg', // Ruta de la imagen de fondo
                fit: BoxFit.cover,    // Asegurarse de que la imagen cubra toda la pantalla
              ),
            ),
            // Widget ModelViewer para mostrar el modelo 3D
            const Positioned.fill(
              child: ModelViewer(
                
                src: 'assets/modelados/astro.glb',
                alt: 'A 3D model of an astronaut',
                ar: true,
                autoRotate: true,
                iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                disableZoom: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

