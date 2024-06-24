import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    required this.text,
    required this.onTap,
  });
}

class MenuContents extends StatelessWidget {
  final String title;
  final List<MenuItem> menuItems;

  const MenuContents({
    super.key,
    required this.title,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MenuCard(
                  text: menuItems[index].text,
                  onTap: menuItems[index].onTap,
                  isFirst: index == 0,
                  isLast: index == menuItems.length - 1,
                ),
                if (index < menuItems.length - 1)
                  const Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: Colors.black,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  const MenuCard({
    super.key,
    required this.text,
    required this.onTap,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius;

    if (isFirst && isLast) {
      // 1つしかない場合、全ての角を丸くする
      borderRadius = BorderRadius.circular(10);
    } else if (isFirst) {
      // 最初のアイテムの場合、上部のみ角丸
      borderRadius = const BorderRadius.vertical(
        top: Radius.circular(10),
      );
    } else if (isLast) {
      // 最後のアイテムの場合、下部のみ角丸
      borderRadius = const BorderRadius.vertical(
        bottom: Radius.circular(10),
      );
    } else {
      // 中間のアイテムの場合、角丸なし
      borderRadius = BorderRadius.zero;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.grey[800],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
