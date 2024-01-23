import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double redColor = 0;
  double blueColor = 0;
  String redTxt = "You Lose";
  String blueTxt = "You Win";
  bool start = true;
  bool result = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double initHeight = MediaQuery.of(context).size.height / 2;
      setState(() {
        redColor = initHeight;
        blueColor = initHeight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (redColor < MediaQuery.of(context).size.height - 6) {
                      redColor = redColor + 10;
                      blueColor = blueColor - 10;
                    } else {
                      redTxt = "You Win";
                      blueTxt = "You Lose";
                      result = true;
                    }
                    start = false;
                  });
                },
                child: Container(
                  height: redColor,
                  color: Color.fromARGB(255, 187, 15, 3),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (blueColor < MediaQuery.of(context).size.height - 6) {
                      redColor = redColor - 10;
                      blueColor = blueColor + 10;
                    } else {
                      blueTxt = "You Win!";
                      redTxt = "You Lose!";
                      result = true;
                    }

                    start = false;
                  });
                },
                child: Container(
                  height: blueColor,
                  color: Color.fromARGB(255, 3, 135, 187),
                ),
              ),
            ],
          ),
          Visibility(
            visible: start,
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    start = false;
                  });
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Press to start'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: result,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      redTxt,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      blueTxt,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
