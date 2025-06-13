import 'package:flutter/material.dart';
import 'package:mem_psi/pages/intro_page.dart';

class LoadinPage extends StatefulWidget {
  const LoadinPage({super.key});

  @override
  State<LoadinPage> createState() => _LoadinPageState();
}

class _LoadinPageState extends State<LoadinPage> {
  @override
  initState() {
    super.initState();
    loadDataApi();
  }

  void loadDataApi() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('assets/images/logo.jpg')));
  }
}
