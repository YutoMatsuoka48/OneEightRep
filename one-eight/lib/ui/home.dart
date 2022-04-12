import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:one_eight/ui/game.dart';

// [Themelist] インスタンスにおける処理。
class Home extends StatelessWidget {
  final String userId;

  const Home({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.red, //色
                                  width: 1, //太さ
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('ロゴ'))),
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.red, //色
                                  width: 1, //太さ
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Game(userId: userId),
                                    ));
                              },
                              child: const Text('対戦オファー'))),
                    ],
                  ),
                  color: Colors.yellow,
                  height: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(color: Colors.red, width: 100, height: 100),
                Container(color: Colors.blue, width: 100, height: 100),
              ],
            ),
            Container(color: Colors.green, width: 100, height: 100),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 200, 198),
    );
  }
}
