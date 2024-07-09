import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void showModal(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.grey[800],
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    builder: (BuildContext context) {
      return SizedBox(
        height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 10),
            const Divider(
              thickness: 4,
              color: Colors.grey,
              indent: 150,
              endIndent: 150,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(14),
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "職種を選択",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: ()=>Navigator.pop(context),
                          child: const Text(
                            "完了",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                "エンジニア・技術職(システム/ネットワーク)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('バックエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('フロントエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('スマートフォンエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('システム開発',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('インフラエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('ネットワーク/サーバー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('パッケージソフト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('プロジェクトマネージャー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('データサイエンティスト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                "エンジニア・技術職(システム/ネットワーク)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('バックエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('フロントエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('スマートフォンエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('システム開発',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('インフラエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('ネットワーク/サーバー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('パッケージソフト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('プロジェクトマネージャー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('データサイエンティスト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                "エンジニア・技術職(システム/ネットワーク)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('バックエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('フロントエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('スマートフォンエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('システム開発',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('インフラエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('ネットワーク/サーバー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('パッケージソフト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('プロジェクトマネージャー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('データサイエンティスト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 0),
                              title: Text(
                                "エンジニア・技術職(システム/ネットワーク)",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('バックエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('フロントエンドエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('スマートフォンエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('システム開発',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('インフラエンジニア',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('ネットワーク/サーバー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('パッケージソフト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('プロジェクトマネージャー',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                                ListTile(title: Text('データサイエンティスト',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          ],
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
    },
  );
}