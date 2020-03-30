import 'dart:math';

import 'package:appointment_consultation/components/dropdown.dart';
import 'package:appointment_consultation/models/appointment.dart';
import 'package:flutter/material.dart';

class AddAppointmentDialog extends StatefulWidget {
  final _formKey;
  final void Function(Appointment) onSubmit;

  AddAppointmentDialog(this._formKey, this.onSubmit);

  @override
  _AddAppointmentDialogState createState() => _AddAppointmentDialogState();
}

class _AddAppointmentDialogState extends State<AddAppointmentDialog> {
  String specialtyValue;
  List<String> specialtyOptions = <String>['Cardiologia', 'Pediatria'];
  String doctorValue;
  List<String> doctorOptions = <String>[];
  String dateValue;
  List<String> dateOptions = <String>[];
  String timeValue;
  List<String> timeOptions = <String>[];

  void onChange(String newValue, String state) {
    setState(() {
      state = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nova Consulta'),
      content: Form(
        key: widget._formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // Dropdowns
            children: <Widget>[
              Dropdown(
                onChange: (newValue) {
                  setState(() {
                    specialtyValue = newValue;
                    doctorOptions = ['João Pedro', 'Fernanda Beatriz'];
                  });
                },
                dropdownValue: specialtyValue,
                dropdownOptions: specialtyOptions,
                hint: 'Especialidade',
              ),
              SizedBox(
                height: 10,
              ),
              Dropdown(
                onChange: (newValue) {
                  setState(() {
                    doctorValue = newValue;
                    dateOptions = ['12/08/2020'];
                  });
                },
                dropdownValue: doctorValue,
                dropdownOptions: doctorOptions,
                hint: 'Médico',
              ),
              SizedBox(
                height: 10,
              ),
              Dropdown(
                onChange: (newValue) {
                  setState(() {
                    dateValue = newValue;
                    timeOptions = ['17:00', '17:30', '18:00'];
                  });
                },
                dropdownValue: dateValue,
                dropdownOptions: dateOptions,
                hint: 'Data',
              ),
              SizedBox(
                height: 10,
              ),
              Dropdown(
                onChange: (newValue) {
                  setState(() {
                    timeValue = newValue;
                  });
                },
                dropdownValue: timeValue,
                dropdownOptions: timeOptions,
                hint: 'Hora',
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar')),
            RaisedButton(
              onPressed: () {
                if (widget._formKey.currentState.validate()) {
                  Navigator.pop(context);
                  widget.onSubmit(
                    Appointment(
                      id: Random().nextDouble().toString(),
                      specialty: specialtyValue,
                      date: dateValue,
                      doctor: doctorValue,
                      time: timeValue,
                    ),
                  );
                }
              },
              child: Text(
                'Confirmar',
                style: Theme.of(context).textTheme.button,
              ),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
            )
          ],
        ),
      ],
    );
  }
}
