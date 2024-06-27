import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kyujin_app/view/message_page/from_agent_page.dart';
import 'package:kyujin_app/view/message_page/from_company_page.dart';

class CompanyMessagePage extends ConsumerWidget {
  const CompanyMessagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _CompanyMessagePageContent();
  }
}

class _CompanyMessagePageContent extends ConsumerStatefulWidget {
  const _CompanyMessagePageContent();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompanyMessagePageState();
}

class _CompanyMessagePageState extends ConsumerState<_CompanyMessagePageContent> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          toolbarHeight: 60,
          bottom: TabBar(
            controller: _tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.lime),
              insets: EdgeInsets.symmetric(horizontal: 0.0),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.lime,
            labelColor: Colors.lime,
            unselectedLabelColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 16),
            tabs: const [
              Tab(text: "企業から"),
              Tab(text: "エージェントから"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            FromCompanyPage(),
            FromAgentPage()
          ],
        ),
      ),
    );
  }

}