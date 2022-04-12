import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_eight/ui/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<Login> {
  String loginEmail = ""; // 入力されたメールアドレス
  String loginPassword = ""; // 入力されたパスワード
  String infoText = ""; // ログインに関する情報を表示

  bool result = false;
  String userId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneEight'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // メールアドレスの入力フォーム
            Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    loginEmail = value;
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "パスワード（8～20文字）"),
                obscureText: true, // パスワードが見えないようRにする
                maxLength: 20, // 入力可能な文字数
                maxLengthEnforcement:
                    MaxLengthEnforcement.enforced, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  loginPassword = value;
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                infoText,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            ButtonTheme(
              minWidth: 350.0,
              // height: 100.0,
              child: ElevatedButton(
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, //ボタンの背景色
                    onPrimary: Colors.red, //ボタン押下時の背景色
                  ),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      //result = await auth.signInWithEmailAndPassword(
                      email:
                      loginEmail;
                      password:
                      loginPassword;

                      // ログイン成功
                      // ログインユーザーのIDを取得
                      userId = loginEmail;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(userId: userId),
                          ));
                    } catch (e) {
                      // ログインに失敗した場合
                      setState(() {
                        infoText = "ログインエラー用メッセージ";
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
