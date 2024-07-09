import 'package:flutter/cupertino.dart';

void showActionSheet(
    BuildContext context,
    {
      String? title,
      String? msg,
      required List<String> args,
      bool cancelButton = true
    }) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) =>
        CupertinoActionSheet(
          title: title != null ? Text(title) : null,
          message: msg != null ? Text(msg) : null,
          actions: args.map((arg) {
            return CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context, arg); // argを返す
              },
              child: Text(arg),
            );
          }).toList(),
          cancelButton: cancelButton ? CupertinoActionSheetAction(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ) : null
        )
  );
}

void showPickerDialog(BuildContext context,List<String> args) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 32.0,
          onSelectedItemChanged: (_) {},
          children: List<Widget>.generate(args.length, (int index) {
            return Center(
              child: Text(
                args[index],
              ),
            );
          }),
        ),
      ),
    ),
  );
}

void showAlertDialog(BuildContext context, {Function? onOkPressed, bool cancelButton = true}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('アラート'),
      content: const Text('通知内容'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
            if (onOkPressed != null) {
              onOkPressed(); // onOkPressedがnullでない場合に実行
            } // 指定のFunctionを実行
          },
          child: const Text('OK'),
        )
      ],
    ),
  );
}
