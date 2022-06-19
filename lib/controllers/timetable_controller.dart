import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:programador_reuniones_flutter/constants/constants.dart';
import 'package:programador_reuniones_flutter/models/enums.dart';
import 'package:programador_reuniones_flutter/models/horario_personal_model.dart';

final timetableProvider = ChangeNotifierProvider<TimetableController>((ref) {
  return TimetableController();
});

class TimetableController with ChangeNotifier {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getTimetable() {
    return FirebaseFirestore.instance.collection('timetables').doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }

  createHorarioPersonal() {
    final horario = SemanaHorarioPersonalModel(
      uid: FirebaseAuth.instance.currentUser!.uid,
      D: DiaHorarioPersonal(weekDay: WeekDays.D, tiempos: Contstants.allTimeslotsFalse),
      L: DiaHorarioPersonal(weekDay: WeekDays.L, tiempos: Contstants.allTimeslotsFalse),
      M: DiaHorarioPersonal(weekDay: WeekDays.M, tiempos: Contstants.allTimeslotsFalse),
      X: DiaHorarioPersonal(weekDay: WeekDays.X, tiempos: Contstants.allTimeslotsFalse),
      J: DiaHorarioPersonal(weekDay: WeekDays.J, tiempos: Contstants.allTimeslotsFalse),
      V: DiaHorarioPersonal(weekDay: WeekDays.V, tiempos: Contstants.allTimeslotsFalse),
      S: DiaHorarioPersonal(weekDay: WeekDays.S, tiempos: Contstants.allTimeslotsFalse),
    );
    FirebaseFirestore.instance.collection("timetables").doc(FirebaseAuth.instance.currentUser!.uid).set(
          horario.toMap(),
        );
  }

  updateHorarioSemanal(SemanaHorarioPersonalModel horarioSemana) {
    FirebaseFirestore.instance.collection("timetables").doc(FirebaseAuth.instance.currentUser!.uid).set(horarioSemana.toMap());
  }
}
