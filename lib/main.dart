import 'package:cms_mobile/pages/users_login_page.dart';
import 'package:flutter/material.dart';

import 'menu.dart' as my_menu;

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
        // 0xFFF7F7F7 (Blanco)
        // 0xFF5A5A5A (Gris)
        // 0xFFEE3F3F (Rojo)
        // 0xFFFF6666 (Rojo Claro)
        // 0xFF5CA7D7 (Azul)
        // 0xFF50BAA5 (Verde)
        // 0xFFFFD700 (Amarillo)
        //colorSchemeSeed: const Color(0xFFed5565), // Rojo Secundario
        primaryTextTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.amber,
          ),
          bodyText2: TextStyle(
            color: Colors.amber,
            fontSize: 22,
          ),
        ),
        primaryColor: const Color(0xFFEE3F3F),
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
          //toolbarHeight: 80,
        ),
        cardTheme: const CardTheme(
          color: Color(0xFFFF6666),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color(0xFF5A5A5A),
          ),
          suffixIconColor: Colors.red,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFFF6666),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFFF6666),
            ),
          ),
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     foregroundColor: const Color(0xFFF7F7F7),
        //     backgroundColor: const Color(0xFFFF6666),
        //     textStyle: const TextStyle(
        //         fontSize: 18,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Awesome'),
        //   ),
        // ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFFF6666),
            ),
            foregroundColor: const Color(0xFFFF6666),
            textStyle: const TextStyle(
                //fontSize: 18,
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
      drawer: const my_menu.NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Aún no has iniciado sesión :-(',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
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
