import 'package:cms_mobile/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMS+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // F7F7F7 (Blanco)
        // 5A5A5A (Gris)
        // EE3F3F (Rojo)
        // FF6666 (Rojo Claro)
        // 5CA7D7 (Azul)
        // 50BAA5 (Verde)
        // FFD700 (Amarillo)
        colorSchemeSeed: const Color(0xFFed5565), // Rojo Secundario
        //brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        fontFamily: 'Awesome',
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            //fontSize: 30,
            color: Color(0xFF666666),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEE3F3F),
          centerTitle: true,
          toolbarHeight: 80,
        ),
        cardTheme: const CardTheme(
          color: Color(0xFFFF6666),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFFF7F7F7),
            backgroundColor: const Color(0xFFFF6666),
            textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Awesome'),
          ),
        ),
      ),
      home: const MyHomePage(title: 'CMS+'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola!',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Aún no has iniciado sesión :-(',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton.icon(
              onPressed: () async {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.login),
              label: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
