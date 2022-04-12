import 'package:flutter/material.dart';
import 'package:one_eight/ui/components/game_widget.dart';
import 'package:one_eight/ui/home.dart';
import 'package:one_eight/ui/login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:one_eight/view_models/game_view_model.dart';
import 'package:one_eight/ui/components/millor_board_widget.dart';
import 'package:one_eight/ui/components/disk_board_widget.dart';

// [Themelist] インスタンスにおける処理。
class Game extends HookConsumerWidget {
  final String userId;

  const Game({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(gameViewModelProvider.notifier);
    final state = ref.watch(gameViewModelProvider);
    //Flutter Hooksの初期化処理
    useEffect(() {
      Future(() {
        viewModel.setInit();
        viewModel.getSymbols(isInit: true, isLoading: true);
        viewModel.getGates(isInit: true, isLoading: true);
      });
      return;
    }, const []);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ヘッダー
            Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                //padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
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
                                        const Home(userId: 'testuser'),
                                  ));
                            },
                            child: const Text('メインメニュー'))),
                  ],
                ),
                height: 50),
            // Loading
            if (state.isLoading)
              const Center(
                child: Text(
                  "Loading...",
                  textAlign: TextAlign.center,
                ),
              ),

            // 対戦相手の情報
            if (!state.isInit && !state.isLoading)
              Container(
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 130,
                        height: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 130,
                        height: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 130,
                        height: 80,
                      ),
                    ],
                  )),
            // ゲーム盤
            if (!state.isInit && !state.isLoading)
              Container(
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    //Container(
                    //  child: Align(
                    //    alignment: Alignment.centerRight,
                    //    child: TextButton(
                    //        style: TextButton.styleFrom(
                    //          side: const BorderSide(
                    //            color: Colors.red, //色
                    //            width: 1, //太さ
                    //          ),
                    //        ),
                    //        onPressed: () {},
                    //        child: const Text('パス')),
                    //  ),
                    //),
                    InteractiveViewer(
                      minScale: 1,
                      maxScale: 5,
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        child: MarketBoard(),
                      ),
                    ),
                  ])),
            // プレイヤーの情報
            if (!state.isInit && !state.isLoading)
              Container(
                  margin: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                    bottom: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 125,
                        height: 125,
                        child: InteractiveViewer(
                            minScale: 1,
                            maxScale: 5,
                            child: const FittedBox(
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                child: MirrorBoard())),
                      ),
                      SizedBox(
                        width: 125,
                        height: 125,
                        child: InteractiveViewer(
                            minScale: 1,
                            maxScale: 5,
                            child: const FittedBox(
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                child: DiskBoard())),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 125,
                        height: 125,
                      ),
                    ],
                  )),
            // フッター
            // Container(
            //   margin: const EdgeInsets.only(
            //     left: 10,
            //     right: 10,
            //   ),
            //   padding: const EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black),
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Padding(
            //           padding: const EdgeInsets.only(left: 15.0),
            //           child: TextButton(
            //               style: TextButton.styleFrom(
            //                 side: const BorderSide(
            //                   color: Colors.red, //色
            //                   width: 1, //太さ
            //                 ),
            //               ),
            //               onPressed: () {},
            //               child: const Text('設定'))),
            //       Padding(
            //           padding: const EdgeInsets.only(left: 15.0),
            //           child: TextButton(
            //               style: TextButton.styleFrom(
            //                 side: const BorderSide(
            //                   color: Colors.red, //色
            //                   width: 1, //太さ
            //                 ),
            //               ),
            //               onPressed: () {},
            //               child: const Text('問い合わせ'))),
            //       Padding(
            //           padding: const EdgeInsets.only(right: 15.0),
            //           child: TextButton(
            //               style: TextButton.styleFrom(
            //                 side: const BorderSide(
            //                   color: Colors.red, //色
            //                   width: 1, //太さ
            //                 ),
            //               ),
            //               onPressed: () {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) =>
            //                           const Home(userId: 'testuser'),
            //                     ));
            //               },
            //               child: const Text('操作説明'))),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 200, 198),
    );
  }
}
