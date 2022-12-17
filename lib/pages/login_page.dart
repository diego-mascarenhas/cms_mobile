import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: loginForm(),
      );

  Widget loginForm() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titulo(),
            campoUser(),
            campoPass(),
            const SizedBox(height: 10),
            botonEntrar(),
          ],
        ),
      ),
    );
  }
}

Widget titulo() {
  return const Text(
    'Iniciar Sesión',
    style: TextStyle(fontSize: 18),
  );
}

Widget campoUser() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Usuario', fillColor: Colors.grey, filled: true),
    ),
  );
}

Widget campoPass() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: const TextField(
      decoration: InputDecoration(
          hintText: 'Contraseña', fillColor: Colors.grey, filled: true),
    ),
  );
}

Widget botonEntrar() {
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Entrar'),
  );
}
