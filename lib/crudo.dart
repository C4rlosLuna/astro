import 'package:astro/admin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'firebase_service.dart';
import 'CatalogScreen.dart'; // Importa el screen del catálogo
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro Productions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.purpleAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 245, 245, 245),
            fontSize: 14,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white24,
          labelStyle: TextStyle(color: Colors.purpleAccent),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purpleAccent),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _link = '';
  String? _editingId;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color.fromARGB(255, 24, 24, 24)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 245, 245, 245)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => admin()));
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: Color.fromARGB(255, 245, 245, 245)),
          onPressed: () => _showAddEditDialog(),
        ),
      ],
    ),
    body: Stack(
      children: [
        // Imagen de fondo
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo.jpg'), // Ruta de la imagen
              fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
            ),
          ),
        ),
        // Contenido principal
        Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPeople(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 127, 38, 123),
                      ),
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
                        'No hay datos disponibles',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  } else {
                    final people = snapshot.data as List<Map<String, dynamic>>;
                    return ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (context, index) {
                        final person = people[index];
                        return Card(
                          color: Color.fromARGB(255, 245, 245, 245),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              person['Titulo'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: GestureDetector(
                              onTap: () async {
                                final url = person['Link'];
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'No se pudo abrir el enlace $url';
                                }
                              },
                              child: Text(
                                person['Link'],
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.black),
                                  onPressed: () => _showAddEditDialog(
                                    id: person['id'],
                                    title: person['Titulo'],
                                    link: person['Link'],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deletePerson(person['id']),
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatalogScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 245, 245, 245),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ver Catálogo de Beats',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

  Future<void> _showAddEditDialog(
      {String? id, String? title, String? link}) async {
    _editingId = id;
    _title = title ?? '';
    _link = link ?? '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            id == null ? 'Agregar Beat' : 'Editar Beat',
            style: const TextStyle(color: Color.fromARGB(255, 245, 245, 245)),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _title,
                  decoration: const InputDecoration(labelText: 'Título'),
                  onChanged: (value) => _title = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: _link,
                  decoration: const InputDecoration(labelText: 'Link'),
                  onChanged: (value) => _link = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar',
                  style: TextStyle(color: Colors.redAccent)),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (_editingId == null) {
                    await addPerson(_title, _link);
                  } else {
                    await updatePerson(_editingId!, _title, _link);
                  }
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: Text(id == null ? 'Agregar' : 'Guardar',
                  style: const TextStyle(color: Colors.greenAccent)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deletePerson(String id) async {
    await deletePerson(id);
    setState(() {});
  }
}
