import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:your_teacher/Dominios/Lesson.dart';
import 'package:your_teacher/Dominios/user.dart';
import 'package:your_teacher/Dominios/Disponibilidad.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
//----------------------------------Empieza User----------------------------------------------------
//--------------------------------------------------------------------------------------------------

Future<List<UserD>> getPeople() async {
  List<UserD> people = [];

  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((documento) {
    Map<String, dynamic>? userData = documento.data() as Map<String, dynamic>?;

    if (userData != null) {
      Timestamp timestamp = userData['fechaNacimiento'] as Timestamp;
      DateTime fechaNacimiento = timestamp.toDate();

      UserD user = UserD(
        correo: userData['correo'] ?? '',
        nombre: userData['nombre'] ?? '',
        apellido: userData['apellido'] ?? '',
        foto: userData['foto'] ?? '',
        tipo: userData['tipo'] ?? '',
        pais: userData['pais'] ?? '',
        fechaNacimiento: DateTime.now(),
      );
      people.add(user);
    }
  });

  return people;
}

Future<void> insertUser(UserD user) async {
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
      'fechaNacimiento': user.fechaNacimiento,
    });
  } else {
    await usersCollection.add({
      'correo': user.correo,
      'nombre': user.nombre,
      'apellido': user.apellido,
      'foto': user.foto,
      'tipo': user.tipo,
      'pais': user.pais,
      'fechaNacimiento': user.fechaNacimiento,
    });
  }
}

Future<bool> existeUser(String correo) async {
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople =
      await collectionReferencePeople.where('correo', isEqualTo: correo).get();

  return queryPeople.docs.isNotEmpty;
}

Future<UserD?> getUserByEmail(String correo) async {
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople =
      await collectionReferencePeople.where('correo', isEqualTo: correo).get();

  if (queryPeople.docs.isNotEmpty) {
    Map<String, dynamic>? userData =
        queryPeople.docs.first.data() as Map<String, dynamic>?;
    Timestamp timestamp = userData?['fechaNacimiento'] as Timestamp;
    DateTime fechaNacimiento = timestamp.toDate();
    if (userData != null) {
      UserD user = UserD(
        correo: userData['correo'] ?? '',
        nombre: userData['nombre'] ?? '',
        apellido: userData['apellido'] ?? '',
        foto: userData['foto'] ?? '',
        tipo: userData['tipo'] ?? '',
        pais: userData['pais'] ?? '',
        fechaNacimiento: fechaNacimiento,
      );

      return user;
    }
  }

  return null;
}

Future<List<UserD>> getAllTeachers() async {
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople =
      await collectionReferencePeople.where('tipo', isEqualTo: 'Teacher').get();

  List<UserD> teachers = [];

  queryPeople.docs.forEach((documento) {
    Map<String, dynamic>? userData = documento.data() as Map<String, dynamic>?;

    if (userData != null) {
      UserD teacher = UserD(
        correo: userData['correo'] ?? '',
        nombre: userData['nombre'] ?? '',
        apellido: userData['apellido'] ?? '',
        foto: userData['foto'] ?? '',
        tipo: userData['tipo'] ?? '',
        pais: userData['pais'] ?? '',
        fechaNacimiento: userData['fechaNacimiento'] ?? '',
      );
      teachers.add(teacher);
    }
  });

  return teachers;
}

Future<List<UserD>> getUsersWithAvailability(String dia) async {
  List<UserD> usersWithAvailability = [];
  List<Disponibilidad> disponibilidades = await getDisponibilidades();

  for (Disponibilidad disponibilidad in disponibilidades) {
    String? attributeValue;
    switch (dia) {
      case 'Domingo':
        attributeValue = disponibilidad.domingo;
        break;
      case 'Lunes':
        attributeValue = disponibilidad.lunes;
        break;
      case 'Martes':
        attributeValue = disponibilidad.martes;
        break;
      case 'Miercoles':
        attributeValue = disponibilidad.miercoles;
        break;
      case 'Jueves':
        attributeValue = disponibilidad.jueves;
        break;
      case 'viernes':
        attributeValue = disponibilidad.viernes;
        break;
      case 'Sabado':
        attributeValue = disponibilidad.sabado;
        break;
      default:
        attributeValue = null;
        break;
    }

    if (attributeValue != null && attributeValue != '') {
      UserD? user = await getUserByEmail(disponibilidad.correo);

      if (user != null) {
        usersWithAvailability.add(user);
      }
    }
  }

  return usersWithAvailability;
}

//----------------------------------Empieza Disponibilidad----------------------------------------------------
//--------------------------------------------------------------------------------------------------

Future<List<Disponibilidad>> getDisponibilidades() async {
  List<Disponibilidad> disponibilidades = [];

  CollectionReference collectionReferenceDisponibilidades =
      db.collection('disponibilidad');
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

Future<Disponibilidad> getDisponibilidadByCorreo(String correo) async {
  CollectionReference collectionReferenceDisponibilidades =
      db.collection('disponibilidad');

  QuerySnapshot queryDisponibilidad = await collectionReferenceDisponibilidades
      .where('correo', isEqualTo: correo)
      .get();

  if (queryDisponibilidad.docs.isNotEmpty) {
    Map<String, dynamic>? disponibilidadData =
        queryDisponibilidad.docs.first.data() as Map<String, dynamic>?;
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

      return disponibilidad;
    }
  }

  Disponibilidad disponibilidad = Disponibilidad(
    correo: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    domingo: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    lunes: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    martes: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    miercoles: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    jueves: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    viernes: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
    sabado: TimeOfDay(hour: 9, minute: 0).toString().substring(10, 15) +
        '-' +
        TimeOfDay(hour: 18, minute: 0).toString().substring(10, 15),
  );
  return disponibilidad;
}

Future<void> insertDisponibilidad(Disponibilidad disponibilidad) async {
  CollectionReference disponibilidadesCollection =
      db.collection('disponibilidad');
  bool disponibilidadExiste = await existeDisponibilidad(disponibilidad.correo);

  if (disponibilidadExiste) {
    QuerySnapshot query = await disponibilidadesCollection
        .where('correo', isEqualTo: disponibilidad.correo)
        .get();
    if (query.docs.isNotEmpty) {
      // Utiliza el primer documento encontrado con el correo específico
      var docId = query.docs.first.id;

      await disponibilidadesCollection.doc(docId).update({
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
      db.collection('disponibilidad');
  QuerySnapshot queryDisponibilidades =
      await collectionReferenceDisponibilidades
          .where('correo', isEqualTo: correo)
          .get();

  return queryDisponibilidades.docs.isNotEmpty;
}

//----------------------------------Empieza   clases  --------------------------
//------------------------------------------------------------------------------

Future<List<Lesson>> getAllLessonsByEmailAC(String? correo) async {
  CollectionReference collectionReferenceClases = db.collection('clases');

  QuerySnapshot queryClases =
      await collectionReferenceClases.where('correo', isEqualTo: correo).get();

  List<Lesson> clasesLista = []; // Declarar la lista aquí

  if (queryClases.docs.isNotEmpty) {
    for (QueryDocumentSnapshot document in queryClases.docs) {
      Map<String, dynamic>? clasesData =
          document.data() as Map<String, dynamic>?;

      if (clasesData != null) {
        Lesson lesson = Lesson(
          correo: clasesData['correo'] ?? '',
          dia: clasesData['dia'] ?? '',
          hora: clasesData['hora'] ?? '',
          link: clasesData['link'] ?? '',
        );

        clasesLista.add(lesson); // Agregar la lección a la lista
      }
    }
  }

  return clasesLista; // Devolver la lista de lecciones
}

Future<void> insertLesson(Lesson lesson) async {
  CollectionReference collectionReferenceClases = db.collection('clases');
  await collectionReferenceClases.add({
    'correo': lesson.correo,
    'dia': lesson.dia,
    'hora': lesson.hora,
    'link': lesson.link,
  });
}
