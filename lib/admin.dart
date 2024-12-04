import 'package:astro/borrar.dart';
import 'package:astro/crudadmin.dart';
import 'package:astro/home.dart';
import 'package:flutter/material.dart';
import 'package:astro/crudo.dart';

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width * 0.36,
            child: Image.asset(
              'assets/AstroAdmin.png',
              width: 400,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.person),
                        color: Color.fromARGB(255, 245, 245, 245),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AuthCRUD()));
                        }),
                    Text(
                      'Perfil',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.book),
                        color: Color.fromARGB(255, 245, 245, 245),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        }),
                    Text(
                      'Catálogo de Beats',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Color.fromARGB(255, 245, 245, 245),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeletePage()));
                      },
                    ),
                    Text(
                      'Contactos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.logout),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => home()));
                      },
                    ),
                    Text(
                      'Salir',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
