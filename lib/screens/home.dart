import 'package:appointment_consultation/components/add_appointment_dialog.dart';
import 'package:appointment_consultation/models/appointment.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  List<Appointment> appointments = [
    Appointment(
      id: 1.toString(),
      specialty: 'd',
      date: 'f',
      doctor: 'd',
      time: 'null',
    ),
  ];

  _showDialogAddAppointment() {
    showDialog(
      context: context,
      builder: (context) {
        return AddAppointmentDialog(_formKey, _addAppointment);
      },
    );
  }

  _addAppointment(Appointment appointment) {
    setState(() {
      appointments.add(appointment);
    });
  }

  _removeAppointment(String id) {
    setState(() {
      appointments.removeWhere((appointment) {
        return appointment.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.07
              : MediaQuery.of(context).size.height * 0.1,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Lucas Mesquita'),
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('Login');
              })
        ],
      ),
      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Consulta Clínica',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RaisedButton(
                      onPressed: _showDialogAddAppointment,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Nova Consulta',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
              appointments.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text('Você não possui consulta marcada'),
                      ),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text('Especialidade'),
                              ),
                              DataColumn(
                                label: Text('Profissional'),
                              ),
                              DataColumn(
                                label: Text('Data'),
                              ),
                              DataColumn(
                                label: Text('Hora'),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: appointments.map((appointment) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(appointment.specialty),
                                  ),
                                  DataCell(
                                    Text(appointment.doctor),
                                  ),
                                  DataCell(
                                    Text(appointment.date),
                                  ),
                                  DataCell(
                                    Text(appointment.time),
                                  ),
                                  DataCell(
                                    FlatButton(
                                      onPressed: () {
                                        _removeAppointment(appointment.id);
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.clear),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Desmarcar'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
