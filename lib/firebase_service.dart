import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

/// Obtener todos los registros
Future<List<Map<String, dynamic>>> getPeople() async {
  List<Map<String, dynamic>> people = [];

  CollectionReference collectionReferencePeople = db.collection('beats');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var documento in queryPeople.docs) {
    people.add({
      'id': documento.id, // Incluimos el ID del documento
      ...documento.data() as Map<String, dynamic>,
    });
  }

  return people;
}

/// Agregar un nuevo registro
Future<void> addPerson(String title, String link) async {
  await db.collection('beats').add({
    'Titulo': title,
    'Link': link,
  });
}

/// Editar un registro existente
Future<void> updatePerson(String id, String title, String link) async {
  await db.collection('beats').doc(id).update({
    'Titulo': title,
    'Link': link,
  });
}

/// Eliminar un registro
Future<void> deletePerson(String id) async {
  await db.collection('beats').doc(id).delete();
}
