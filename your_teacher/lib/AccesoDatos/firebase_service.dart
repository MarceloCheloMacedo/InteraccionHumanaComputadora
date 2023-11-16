import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_teacher/Dominios/User.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
//----------------------------------Empieza User----------------------------------------------------
//--------------------------------------------------------------------------------------------------

Future<List<User>> getPeople() async {
  List<User> people = [];

  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((documento) {
    Map<String, dynamic>? userData = documento.data() as Map<String, dynamic>?;

    if (userData != null) {
      User user = User(
        correo: userData['correo'] ?? '',
        nombre: userData['nombre'] ?? '',
        apellido: userData['apellido'] ?? '',
        foto: userData['foto'] ?? '',
        tipo: userData['tipo'] ?? '',
        pais: userData['pais'] ?? '',
      );
      people.add(user);
    }
  });

  return people;
}

Future<void> insertUser(User user) async {
  CollectionReference usersCollection = db.collection('people');
  bool personaExiste = await existeUser(user.correo);

  if (personaExiste) {
    await usersCollection.doc(user.correo).update({
      'correo': user.correo,
      'nombre': user.nombre,
      'apellido': user.apellido,
      'foto': user.foto,
      'tipo': user.tipo,
      'pais': user.pais,
    });
  } else {
    await usersCollection.add({
      'correo': user.correo,
      'nombre': user.nombre,
      'apellido': user.apellido,
      'foto': user.foto,
      'tipo': user.tipo,
      'pais': user.pais,
    });
  }
}

Future<bool> existeUser(String correo) async {
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople =
      await collectionReferencePeople.where('correo', isEqualTo: correo).get();

  return queryPeople.docs.isNotEmpty;
}

//----------------------------------Empieza Disponibilidad----------------------------------------------------
//--------------------------------------------------------------------------------------------------

Future<List<Disponibilidad>> getDisponibilidades() async {
  List<Disponibilidad> disponibilidades = [];

  CollectionReference collectionReferenceDisponibilidades =
      db.collection('disponibilidades');
  QuerySnapshot queryDisponibilidades =
      await collectionReferenceDisponibilidades.get();

  queryDisponibilidades.docs.forEach((documento) {
    Map<String, dynamic>? disponibilidadData =
        documento.data() as Map<String, dynamic>?;

    if (disponibilidadData != null) {
      Disponibilidad disponibilidad = Disponibilidad(
        correo: disponibilidadData['correo'] ?? '',
        domingo: disponibilidadData['domingo'] ?? '',
        lunes: disponibilidadData['lunes'] ?? '',
        martes: disponibilidadData['martes'] ?? '',
        miercoles: disponibilidadData['miercoles'] ?? '',
        jueves: disponibilidadData['jueves'] ?? '',
        viernes: disponibilidadData['viernes'] ?? '',
        sabado: disponibilidadData['sabado'] ?? '',
      );
      disponibilidades.add(disponibilidad);
    }
  });

  return disponibilidades;
}

Future<void> insertDisponibilidad(Disponibilidad disponibilidad) async {
  CollectionReference disponibilidadesCollection =
      db.collection('disponibilidades');
  bool disponibilidadExiste = await existeDisponibilidad(disponibilidad.correo);

  if (disponibilidadExiste) {
    await disponibilidadesCollection.doc(disponibilidad.correo).update({
      'domingo': disponibilidad.domingo,
      'lunes': disponibilidad.lunes,
      'martes': disponibilidad.martes,
      'miercoles': disponibilidad.miercoles,
      'jueves': disponibilidad.jueves,
      'viernes': disponibilidad.viernes,
      'sabado': disponibilidad.sabado,
    });
  } else {
    await disponibilidadesCollection.add({
      'correo': disponibilidad.correo,
      'domingo': disponibilidad.domingo,
      'lunes': disponibilidad.lunes,
      'martes': disponibilidad.martes,
      'miercoles': disponibilidad.miercoles,
      'jueves': disponibilidad.jueves,
      'viernes': disponibilidad.viernes,
      'sabado': disponibilidad.sabado,
    });
  }
}

Future<bool> existeDisponibilidad(String correo) async {
  CollectionReference collectionReferenceDisponibilidades =
      db.collection('disponibilidades');
  QuerySnapshot queryDisponibilidades =
      await collectionReferenceDisponibilidades
          .where('correo', isEqualTo: correo)
          .get();

  return queryDisponibilidades.docs.isNotEmpty;
}

//----------------------------------Empieza     ----------------------------------------------------
//--------------------------------------------------------------------------------------------------