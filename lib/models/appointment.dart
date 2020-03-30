import 'package:flutter/material.dart';

class Appointment {
  String id;
  String specialty;
  String doctor;
  String date;
  String time;

  Appointment({
    @required this.id,
    @required this.specialty,
    @required this.date,
    @required this.doctor,
    @required this.time,
  });
}
