import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyujin_app/core/component/menu_contents.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
            'その他',
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white)
        ),
        backgroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1.0,
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //お知らせ
              MenuContents(
                  title: "お知らせ",
                  menuItems: [
                    MenuItem(
                      text: "お知らせ",
                      onTap: (){

                      }
                    ),
                  ]
              ),
              const SizedBox(height: 30),

              //アプローチ設定
              MenuContents(
                  title: "アプローチ設定",
                  menuItems: [
                    MenuItem(
                        text: "気になる・スカウト受信",
                        onTap: (){

                        }
                    ),
                    MenuItem(
                        text: "ブロック企業",
                        onTap: (){

                        }
                    ),
                  ]
              ),
              const SizedBox(height: 30),

              //通知
              MenuContents(
                  title: "通知",
                  menuItems: [
                    MenuItem(
                        text: "Push通知設定",
                        onTap: (){

                        }
                    ),
                  ]
              ),
              const SizedBox(height: 30),

              //その他
              MenuContents(
                  title: "その他",
                  menuItems: [
                    MenuItem(
                        text: "メールマガジン配信設定",
                        onTap: (){

                        }
                    ),
                    MenuItem(
                        text: "パスワード変更",
                        onTap: (){

                        }
                    ),MenuItem(
                        text: "入社確定連絡(お祝い金申請)",
                        onTap: (){

                        }
                    ),MenuItem(
                        text: "違反行為を報告",
                        onTap: (){

                        }
                    ),MenuItem(
                        text: "アプリへのご要望・不具合報告",
                        onTap: (){

                        }
                    ),MenuItem(
                        text: "ライセンス情報",
                        onTap: (){

                        }
                    ),MenuItem(
                        text: "ログアウト",
                        onTap: (){

                        }
                    ),
                  ]
              ),
              const SizedBox(height: 30),

              //利用規約
              MenuContents(
                  title: "利用規約とデータ利用ポリシー",
                  menuItems: [
                    MenuItem(
                        text: "利用規約",
                        onTap: (){

                        }
                    ),
                    MenuItem(
                        text: "個人情報の取り扱い",
                        onTap: (){

                        }
                    ),
                    MenuItem(
                        text: "利用者情報の外部送信について",
                        onTap: (){

                        }
                    ),
                  ]
              ),
              const SizedBox(height: 30),

              //退会
              MenuContents(
                  title: "退会",
                  menuItems: [
                    MenuItem(
                        text: "退会に関して",
                        onTap: (){

                        }
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}