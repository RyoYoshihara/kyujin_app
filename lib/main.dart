import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kyujin_app/router/route_generator.dart';
import 'package:kyujin_app/view/home_page/home_page.dart';

import 'core/colors_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //画面向きを縦に固定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        const ProviderScope(
          child: MyApp(),
        )
    );
  });

}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Recruit App',
      home: const HomePage(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.onGenerate,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoEffectBehavior(),
          child: child ?? const SizedBox(),
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: ColorsManager.black
      ),
    );

  }
}

// アンドロイドでオーバースクロールした際のエフェクトの削除
class NoEffectBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
