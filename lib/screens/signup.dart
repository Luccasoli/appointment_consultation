import 'package:appointment_consultation/constants.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordInvisible = true;
  bool _autovalidate = false;

  String email;
  String name;
  String password;
  String repeatPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                autovalidate: _autovalidate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Crie sua conta',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onSaved: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Esse campo não pode ser vazio';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!Constants.emailValidator.hasMatch(value)) {
                          return 'Insira um email válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !isPasswordInvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordInvisible = !isPasswordInvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: isPasswordInvisible,
                      onSaved: (newValue) {
                        password = newValue;
                      },
                      onChanged: (newValue) {
                        setState(() {
                          password = newValue;
                        });
                      },
                      validator: (value) {
                        if (value.length < 8) {
                          return 'Sua senha deve conter ao menos 8 caracteres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Repita a Senha',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !isPasswordInvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordInvisible = !isPasswordInvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: isPasswordInvisible,
                      onChanged: (newValue) {
                        setState(() {
                          password = newValue;
                        });
                      },
                      onSaved: (newValue) {
                        repeatPassword = newValue;
                      },
                      validator: (value) {
                        if (value.length < 8) {
                          return 'Sua senha deve conter ao menos 8 caracteres';
                        }
                        if (value != password)
                          return 'Suas senhas devem ser iguais';
                        return null;
                      },
                    ),
                    Builder(builder: (localContext) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar')),
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Scaffold.of(localContext).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Cadastro Realizado Com Sucesso!'),
                                  ),
                                );
                                Navigator.of(context).pop();
                              } else {
                                setState(() {
                                  _autovalidate = true;
                                });
                                Scaffold.of(localContext).showSnackBar(
                                  SnackBar(
                                    content: Text('Insira dados válidos'),
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
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
