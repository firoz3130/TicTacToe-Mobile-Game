import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int boolToInt(bool a) => a ? 1 : 0;

  List<int> tile;

  AssetImage zero = AssetImage("lib/assets/o.jpeg");
  AssetImage cross = AssetImage("lib/assets/x.jpeg");
  AssetImage blank = AssetImage("lib/assets/grey.jpeg");
  AssetImage bg = AssetImage("lib/assets/grey.jpeg");
  AssetImage button = AssetImage("lib/assets/restart.jpeg");

  List<AssetImage> play;

  int remaining = 9;

  bool zeroTurn = false;

  String message = "TURN OF CROSS";

  changeState(i) {
    setState(() {
      if (tile[i] == 0) {
        tile[i] = boolToInt(zeroTurn) + 1;
        play[i] = getimage(tile[i]);

        if (zeroTurn) {
          message = "Cross 's Turn";
          remaining--;
        } else {
          message = "Zero 's Turn";
          remaining--;
        }

        if (remaining == 0) {
          if (checkWin()) {
            if (zeroTurn) {
              message = "Zero Wins the game";
            } else {
              message = "Cross Wins the game";
            }
          } else
            message = "OMG!!!Game ends in Draw";
        } else if (checkWin()) {
          if (zeroTurn) {
            message = "Zero Wins the game";
          } else {
            message = "Cross Wins the game";
          }

          for (int i = 0; i < 9; i++) {
            if (tile[i] == 0) {
              tile[i] = 3;
            }
          }
        }

        zeroTurn = !zeroTurn;
      } else {}
    });
  }

  AssetImage getimage(i) {
    switch (i) {
      case 0:
        return blank;
        break;

      case 1:
        return cross;
        break;

      case 2:
        return zero;
    }
    return zero;
  }

  bool checkWin() {
    if ((tile[0] == tile[1] &&
            tile[1] == tile[2] &&
            tile[1] != 0 &&
            tile[1] != 3) ||
        (tile[3] == tile[4] &&
            tile[4] == tile[5] &&
            tile[4] != 0 &&
            tile[4] != 3) ||
        (tile[6] == tile[7] &&
            tile[7] == tile[8] &&
            tile[7] != 0 &&
            tile[7] != 3) ||
        (tile[0] == tile[3] &&
            tile[3] == tile[6] &&
            tile[3] != 0 &&
            tile[3] != 3) ||
        (tile[1] == tile[4] &&
            tile[4] == tile[7] &&
            tile[4] != 0 &&
            tile[4] != 3) ||
        (tile[2] == tile[5] &&
            tile[5] == tile[8] &&
            tile[5] != 0 &&
            tile[5] != 3) ||
        (tile[0] == tile[4] &&
            tile[4] == tile[8] &&
            tile[4] != 0 &&
            tile[4] != 3) ||
        (tile[6] == tile[4] &&
            tile[4] == tile[2] &&
            tile[4] != 0 &&
            tile[4] != 3)) {
      return true;
    } else
      return false;
  }

  resetGame() {
    setState(() {
      tile = [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ];

      play = [
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
      ];
      message = "Cross 's Turn";
      zeroTurn = false;
      remaining = 9;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      tile = [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ];

      play = [
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
        blank,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image(image: bg),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, i) => SizedBox(
                      height: 10.0,
                      width: 10.0,
                      child: MaterialButton(
                        splashColor: Colors.tealAccent,
                        child: Image(image: play[i]),
                        onPressed: () {
                          changeState(i);
                        },
                      ),
                    ),
                    itemCount: 9,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'chalk',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: MaterialButton(
                    elevation: 0,
                    splashColor: Colors.tealAccent,
                    color: Colors.black,
                    child: Image(
                      image: button,
                      width: 150,
                    ),
                    onPressed: resetGame,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
