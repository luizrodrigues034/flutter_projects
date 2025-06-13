import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  void dispose() {
    //Quando a pagina for descartada
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: <Widget>[
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 0',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 1',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
                StructureCards(
                  caminhoImagem: 'assets/images/fashion.png',
                  titulo: 'Page 2',
                  subititulo:
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Expanded(
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text('')),
                  Expanded(
                    flex: 1,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: _currentPage.toDouble(),
                      decorator: DotsDecorator(
                        colors: [Colors.grey, Colors.grey, Colors.grey],
                        activeColors: [
                          Color(0xFFF83758),
                          Color(0xFFF83758),
                          Color(0xFFF83758),
                        ],
                        size: const Size.square(18.0),
                        activeSize: const Size(50, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (_currentPage < 2) {
                            _currentPage += 1;
                            _pageController.animateToPage(
                              _currentPage,
                              duration: Duration(microseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }
                        });
                      },
                      child: _currentPage == 2
                          ? Text(
                              'Get Start',
                              style: TextStyle(
                                color: Color(0xFFF83758),
                                fontStyle: GoogleFonts.montserrat().fontStyle,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            )
                          : Text(
                              'Next',
                              style: TextStyle(
                                color: Color(0xFFF83758),
                                fontStyle: GoogleFonts.montserrat().fontStyle,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StructureCards extends StatelessWidget {
  final String caminhoImagem;
  final String titulo;
  final String subititulo;
  const StructureCards({
    required this.caminhoImagem,
    required this.titulo,
    required this.subititulo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(caminhoImagem, width: 300, height: 300),
        Text(
          titulo,
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 34,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Text(
            subititulo,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA8A8A9),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
