import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'firebase_service.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color.fromARGB(255, 24, 24, 24),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 245, 245, 245),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: getPeople(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 127, 38, 123)),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Error al cargar datos',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    'No hay beats disponibles',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              } else {
                final beats = snapshot.data!;
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: beats.length,
                  itemBuilder: (context, index) {
                    final beat = beats[index];
                    return Card(
                      color: Colors.black.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 127, 38, 123)),
                      ),
                      child: InkWell(
                        onTap: () async {
                          final url = beat['Link'];
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'No se pudo abrir el enlace $url';
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/destiny.jpg', // Reemplaza con la ruta de tu imagen en assets
                              height:
                                  500, // Ajusta el tamaño según sea necesario
                            ),
                            const SizedBox(height: 8),
                            Text(
                              beat['Titulo'] ?? 'Sin título',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 127, 38, 123),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Ver más',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 245, 245, 245),
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

