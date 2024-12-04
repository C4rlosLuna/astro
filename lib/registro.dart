import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controladores para los campos del formulario
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController artisticNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? selectedPackage;

  // GlobalKey para validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Método para guardar los datos en Firestore
  Future<void> saveToFirestore() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Guardar en Firestore
        await FirebaseFirestore.instance.collection('registrations').add({
          'name': nameController.text,
          'last_name': lastNameController.text,
          'artistic_name': artisticNameController.text,
          'email': emailController.text,
          'phone': int.tryParse(
              phoneController.text), // Convierte a número si es posible
          'package': selectedPackage,
          'timestamp': FieldValue.serverTimestamp(), // Fecha/hora del servidor
        });

        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso')),
        );

        // Esperar 3 segundos antes de navegar a otra pantalla
        await Future.delayed(const Duration(seconds: 3));

        // Navegar a otra pantalla (por ejemplo, HomePage)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SuccessPage()),
        );

        // Limpiar los campos después de registrar
        nameController.clear();
        lastNameController.clear();
        artisticNameController.clear();
        emailController.clear();
        phoneController.clear();
        setState(() {
          selectedPackage = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verificamos el tamaño de la pantalla
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Asocia la clave para validación
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo fuera del contenedor
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Image.asset(
                        'assets/logotipografico.png',
                        height: screenHeight * 0.18, // 20% de la altura
                      ),
                    ),
                    // Contenedor del formulario
                    Container(
                      width: screenWidth * 0.6, // 60% del ancho
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 127, 38, 123)),
                        color: const Color.fromARGB(200, 24, 24, 24),
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título del formulario
                          Center(
                            child: Text(
                              'Ponte en Contacto',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    screenWidth * 0.03, // Tamaño proporcional
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico-Regular',
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Campos del formulario
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Nombre',
                              hintStyle: const TextStyle(color: Colors.white54),
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa tu nombre';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              hintText: 'Apellidos',
                              hintStyle: const TextStyle(color: Colors.white54),
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa tus apellidos';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            controller: artisticNameController,
                            decoration: InputDecoration(
                              hintText: 'Nombre artístico/Agrupación',
                              hintStyle: const TextStyle(color: Colors.white54),
                              border: const OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.015), // Espaciado proporcional
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Correo electrónico',
                              hintStyle: const TextStyle(color: Colors.white54),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.02),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa un correo electrónico';
                              }
                              // Validación de formato de correo electrónico
                              String pattern =
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Por favor ingresa un correo válido';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.015), // Espaciado proporcional
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: 'Número Telefónico',
                              hintStyle: const TextStyle(color: Colors.white54),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.02),
                              ),
                            ),
                            keyboardType:
                                TextInputType.number, // Teclado numérico
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa tu número telefónico';
                              }
                              // Validación de número de teléfono
                              if (int.tryParse(value) == null) {
                                return 'Por favor ingresa un número válido';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height: screenHeight *
                                  0.02), // Espaciado proporcional

                          // Dropdown para seleccionar el paquete
                          Row(
                            children: [
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    hintText: '¿Qué servicio requieres?',
                                    hintStyle: TextStyle(color: Colors.white54),
                                    border: OutlineInputBorder(),
                                  ),
                                  items: [
                                    'Paquete',
                                    'Beat',
                                  ]
                                      .map((month) => DropdownMenuItem(
                                            value: month,
                                            child: Text(month,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPackage = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Por favor selecciona un paquete';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          // Botón para registrar
                          SizedBox(height: screenHeight * 0.02),
                          Center(
                            child: ElevatedButton(
                              onPressed: saveToFirestore,
                              child: const Text('Registrarte'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02,
                                  horizontal: screenWidth * 0.1,
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 127, 38, 123),
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit
            .expand, // Expande el Stack para cubrir todo el área disponible
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Reemplaza con la ruta de tu imagen de fondo
              fit: BoxFit
                  .cover, // Ajusta la imagen para cubrir todo el espacio disponible
            ),
          ),
          // Contenido (Texto y Botón)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen centrada
                Image.asset(
                  'assets/astro3.png', // Reemplaza con la ruta de tu imagen centrada
                  height: 400, // Ajusta el tamaño según sea necesario
                ),
                const SizedBox(
                    height: 20), // Espaciado entre la imagen y el texto
                const Text(
                  '¡Gracias por contactarnos! Recibirás pronto una respuesta vía Whatsapp.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white, // Cambia el color según lo necesites
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 20), // Espaciado entre el texto y el botón
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Volver atrás
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
