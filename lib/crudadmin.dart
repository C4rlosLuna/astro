import 'package:astro/agregarAdmin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCRUD extends StatefulWidget {
  const AuthCRUD({Key? key}) : super(key: key);

  @override
  State<AuthCRUD> createState() => _AuthCRUDState();
}

class _AuthCRUDState extends State<AuthCRUD> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _userId;
  String? _email;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
        _email = user.email;
      });
    }
  }

  Future<void> _updateEmail() async {
    if (_emailController.text.isEmpty) return;

    try {
      await _auth.currentUser!.updateEmail(_emailController.text.trim());
      await _auth.currentUser!.reload();
      _loadUserData();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Correo actualizado exitosamente")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  Future<void> _updatePassword() async {
    if (_passwordController.text.isEmpty) return;

    try {
      await _auth.currentUser!.updatePassword(_passwordController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Contraseña actualizada exitosamente")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  Future<void> _deleteAccount() async {
    try {
      await _auth.currentUser!.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cuenta eliminada exitosamente")),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Color.fromARGB(255, 24, 24, 24),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 245, 245, 245),), 
      onPressed: () {
        Navigator.pop(context); 
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.add,color: Color.fromARGB(255, 245, 245, 245),), 
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Agregaradmin()), 
          );
        },
      ),
    ],
  ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fondo.jpg"), // Ruta de tu imagen en assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido del formulario
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Usuario:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Ubuntu-Regular'),
                ),
                const SizedBox(height: 8),
                Text("ID: ${_userId ?? "No autenticado"}", style: const TextStyle(color: Colors.white)),
                Text("Email: ${_email ?? "No autenticado"}", style: const TextStyle(color: Colors.white)),
                const Divider(height: 30, color: Colors.white),
                const Text(
                  "Actualizar Contraseña",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Ubuntu-Regular'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Nueva Contraseña",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _updatePassword,
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 245, 245, 245)),
                  child: const Text("Actualizar Contraseña", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),)), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
