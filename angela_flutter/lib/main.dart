import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 1, 125, 113),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/foto.jpeg'),
              ),
              Text(
                "Luiz",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: GoogleFonts.sourceCodePro(
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(
                height: 20,
                child: Divider(color: Colors.white),
                width: 150,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.phone,
                      color: const Color.fromARGB(255, 0, 101, 91),
                    ),
                    title: Text(
                      "+55 (99) 99103-2974",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                // Este Card estava fora da lista de children da Column
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 1, 107, 96),
                    ),
                    title: Text(
                      "yourmail@email.com",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.teal.shade900, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ], // Fechamento correto da lista de children
          ),
        ),
      ),
    );
  }
}
