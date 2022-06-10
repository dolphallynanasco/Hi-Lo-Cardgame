import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: Menu(),
  ));
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => Menu_State();
}

class Gameover extends StatefulWidget {
  const Gameover({Key? key}) : super(key: key);

  @override
  State<Gameover> createState() => MenuState();
}

class MenuState extends State<Gameover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu_portrait.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black12.withOpacity(0.0),
                  Colors.black87.withOpacity(0.6)
                ], begin: Alignment.center),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 1366.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black87])),
                  )),
            ),
          ),
          Positioned(
              left: 5,
              bottom: 250,
              child: Image.asset(
                'assets/gameover portrait.png',
                width: 400,
                height: 500,
              )),
          Positioned(
              left: 130,
              bottom: 220,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game()));
                },
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(200, 150)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 30,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(184, 218, 165, 32))),
                child: Text('Try Again'),
              )),
          Positioned(
              left: 160,
              bottom: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                },
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(200, 150)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 30,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(184, 218, 165, 32))),
                child: Text('Exit'),
              ))
        ],
      ),
    );
  }
}

class Getpicture extends StatefulWidget {
  int index = 0;
  final Function callback;
  Getpicture({required this.callback, required this.index});

  @override
  State<Getpicture> createState() => GetpictureState();
}

class GetpictureState extends State<Getpicture> {
  int selector = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        selector = Random().nextInt(52);

        setState(() {
          index++;
        });
        widget.callback(selector, index);
      },
      child: Text('REVEAL',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontSize: 30,
            color: Color.fromARGB(255, 252, 252, 252),
          )),
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(184, 218, 165, 32),
          padding: EdgeInsets.fromLTRB(10, 13, 10, 13)),
    );
  }
}

class Howtoplay extends StatelessWidget {
  const Howtoplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('backgroundhelp.jpg'),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Positioned(
                      left: 160,
                      bottom: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Menu()));
                        },
                        style: ButtonStyle(
                            maximumSize:
                                MaterialStateProperty.all(Size(200, 150)),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 30,
                            )),
                            elevation: MaterialStateProperty.all<double>(20.0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(184, 218, 165, 32))),
                        child: Text('Back'),
                      )),
                  Positioned(
                    left: 15,
                    bottom: 200,
                    child: SingleChildScrollView(
                        child: Column(
                      children: const [
                        Text('Instructions:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            )),
                        Text(' ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            )),
                        Text('To play the game, click the reveal button',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' first to reveal the first card,',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text('After that, you can choose between HIGH',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' or LOW to guess the next card,',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text('Click the reveal button again and',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' repeat the steps,',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text('Just click REVEAL, choose between HIGH',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' or LOW then click REVEAL again.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text('Clicking the LOW button before or after',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' clicking the REVEAL button will be an',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                        Text(' automatic gameover.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 252, 252, 252),
                            )),
                      ],
                    )),
                  )
                ]))));
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => HomeState();
}

class HomeState extends State<Game> {
  List<int> lastguesses = [];
  final String str = ('Your number is  ');
  int random = 0;
  int previous = 0;
  int score = 0;
  int index = 0;
  int guessed_card1 = 53;
  int guessed_card2 = 53;
  int guessed_card3 = 53;
  int guessed_card4 = 53;
  int guessed_card5 = 53;
  int future_value = -1;
  int previous_value = 0;
  callback(selector, temp) async {
    index = temp;
    await Future.delayed(const Duration(seconds: 2), () {
      previous = random;
      guessed_card1 = previous;
      setState(() {
        random = selector;
      });
    });
  }

  callback1(previousval) async {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        guessed_card2 = previousval;
      });
    });
  }

  callback2() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card3 = guessed_card2;
      });
    });
  }

  callback3() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        guessed_card4 = guessed_card3;
      });
    });
  }

  callback4(previousval) {
    Future.delayed(const Duration(seconds: 0), () async {
      guessed_card5 = previousval;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/backgroundmiddle portrait.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 315,
                bottom: 100,
                child: Image.asset(
                  'assets/$guessed_card5.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                left: 235,
                bottom: 100,
                child: Image.asset(
                  'assets/$guessed_card4.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                left: 155,
                bottom: 100,
                child: Image.asset(
                  'assets/$guessed_card3.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                left: 75,
                bottom: 100,
                child: Image.asset(
                  'assets/$guessed_card2.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                left: -5,
                bottom: 100,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                top: 60,
                left: 130,
                child: Image.asset(
                  'assets/$guessed_card1.png',
                  width: 150,
                  height: 250,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 250,
                child: ElevatedButton(
                  child: Text('HIGH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 30,
                        color: Color.fromARGB(255, 252, 252, 252),
                      )),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);

                    if (previous_value <= future_value && index != 0) {
                      print('$previous_value,$future_value');
                      score++;
                      print('Score :$score');
                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gameover()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(184, 218, 165, 32),
                      padding: EdgeInsets.fromLTRB(10, 13, 10, 13)),
                ),
              ),
              Positioned(
                left: 315,
                bottom: 250,
                child: ElevatedButton(
                  child: Text('LOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 30,
                        color: Color.fromARGB(255, 252, 252, 252),
                      )),
                  onPressed: () {
                    List<int> cardValues = [
                      1,
                      1,
                      1,
                      1,
                      2,
                      2,
                      2,
                      2,
                      3,
                      3,
                      3,
                      3,
                      4,
                      4,
                      4,
                      4,
                      5,
                      5,
                      5,
                      5,
                      6,
                      6,
                      6,
                      6,
                      7,
                      7,
                      7,
                      7,
                      8,
                      8,
                      8,
                      8,
                      9,
                      9,
                      9,
                      9,
                      10,
                      10,
                      10,
                      10,
                      11,
                      11,
                      11,
                      11,
                      12,
                      12,
                      12,
                      12,
                      13,
                      13,
                      13,
                      13
                    ];
                    future_value = cardValues.elementAt(random);
                    previous_value = cardValues.elementAt(previous);
                    if (previous_value > future_value) {
                      print('$previous_value,$future_value');

                      score++;
                      print('Score :$score');
                      Future.delayed(const Duration(seconds: 1), () {
                        callback3();
                        callback2();
                        setState(() {
                          callback1(previous);
                        });
                        callback4(guessed_card4);
                      });
                    } else {
                      setState(() {
                        score = 0;
                        random = 0;
                        previous_value = 0;
                        future_value = 0;
                        guessed_card1 = 53;
                        guessed_card2 = 53;
                        guessed_card3 = 53;
                        guessed_card4 = 53;
                        guessed_card5 = 53;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gameover()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(184, 218, 165, 32),
                      padding: EdgeInsets.fromLTRB(10, 13, 10, 13)),
                ),
              ),
              Positioned(
                  bottom: 250,
                  left: 140,
                  child: Getpicture(
                    callback: callback,
                    index: index,
                  )),
              Positioned(
                  top: 15,
                  left: 160,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Score: $score',
                        style: TextStyle(
                            color: Color.fromARGB(184, 252, 251, 251)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(184, 218, 165, 32),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu_State extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background portrait.png'),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black12.withOpacity(0.0),
                  Colors.black87.withOpacity(0.6)
                ], begin: Alignment.center),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 1366.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.black87])),
                  )),
            ),
          ),
          Positioned(
              left: 5,
              bottom: 200,
              child: Image.asset(
                'assets/hi-lo_cardgame.png',
                width: 400,
                height: 500,
              )),
          Positioned(
              left: 160,
              bottom: 220,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game()));
                },
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(200, 150)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 30,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(184, 218, 165, 32))),
                child: Text('Start'),
              )),
          Positioned(
              left: 120,
              bottom: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Howtoplay()));
                },
                style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(Size(200, 150)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 30,
                    )),
                    elevation: MaterialStateProperty.all<double>(20.0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(184, 218, 165, 32))),
                child: Text('How To Play'),
              ))
        ],
      ),
    );
  }
}
