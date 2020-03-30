import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool rememberPasswordValue = false;
  bool isPasswordInvisible = true;

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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email ou Login',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
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
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rememberPasswordValue = !rememberPasswordValue;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: rememberPasswordValue,
                            onChanged: (newValue) {
                              setState(() {
                                rememberPasswordValue = newValue;
                              });
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text('Lembrar minha senha?'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {}, child: Text('Criar Conta')),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('Home');
                          },
                          child: Text(
                            'Acessar',
                            style: Theme.of(context).textTheme.button,
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                        )
                      ],
                    )
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
