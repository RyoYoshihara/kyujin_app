import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          preferredSize: Size.fromHeight(1.0), // Dividerの高さを設定
          child: Divider(
            height: 1.0, // Dividerの高さを設定
            thickness: 1.0, // Dividerの厚さを設定
            color: Colors.grey, // Dividerの色を設定
          ),
        ),
      ),
    );
  }
}