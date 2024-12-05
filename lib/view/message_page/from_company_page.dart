import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dialog_manager.dart';
import '../../core/image_manager.dart';
import '../../core/modal_manager.dart';
import '../../model/message_page/from_company.dart';
import '../../viewmodel/message_page/from_company_page_viewmodel.dart';

const  List<String> choices01 = <String>['指定なし', '未読', '未返信', '非表示'];

class FromCompanyPage extends ConsumerWidget {
  const FromCompanyPage({super.key});

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fromCompanyViewModelProvider);
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _refresh,
      child: state.fromCompany.when(
        data: (value) => MessageList(value.messages),
        error: (_, __) => Container(),
        loading: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class MessageList extends ConsumerWidget {
  final List<FromCompany> messages;
  const MessageList(this.messages, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
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
                          showModal(context);
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
              ...List.generate(
                  messages.length,
                      (index) => _messageWidget(messages[index])
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _messageWidget(FromCompany fromCompany) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Row(
          children: [
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: fromCompany.imageUrl.isNotEmpty
                    ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(fromCompany.imageUrl),
                )
                    : const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageManager.noImage),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!fromCompany.isOfficial)
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: fromCompany.isRead ? Colors.grey : Colors.lime,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_outlined, size: 14),
                            SizedBox(width: 5),
                            Text(
                              "スカウト",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (!fromCompany.isOfficial) const SizedBox(height: 5),
                  Text(
                    fromCompany.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    fromCompany.appeal,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Container(
                      decoration: BoxDecoration(
                        color:  Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.business_center,color: Colors.grey,size: 15,),
                                const SizedBox(width:5),
                                Text(
                                  fromCompany.recruitmentDetails,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.attach_money,color: Colors.grey,size: 15,),
                                const SizedBox(width:5),
                                Text(
                                  fromCompany.salary,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      if (!fromCompany.isRead)
        Positioned(
          top: 25,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
    ],
  );
}
