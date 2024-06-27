import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dialog_manager.dart';

const  List<String> choices01 = <String>['指定なし', '未読', '未返信', '非表示'];

class FromCompanyPage extends ConsumerWidget {
  const FromCompanyPage({super.key});

  Future<void> _refresh() async {

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _refresh,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight,minWidth: constraints.maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            'メッセージ状況',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            '職種',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            '勤務地',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            '最低年収',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            'カジュアル面談',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            'リモート勤務可',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            showPickerDialog(context,choices01);
                          },
                          child: const Text(
                            '未経験歓迎',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
