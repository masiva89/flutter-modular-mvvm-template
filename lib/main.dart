import 'package:flutter/material.dart';

import 'product/init/index.dart';

/// Project navigator key.
final navigatorKey = GlobalKey<NavigatorState>();

/// Project scaffold messenger key.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// Project scaffold key.
final globalScaffoldKey = GlobalKey<ScaffoldState>();

//sprint-1
void main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // You should use this returned widget instead of the active one.
    /* return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        unFocusAll(context);
      },
      child: MaterialApp.router(
        key: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: _appRouter.config(),
        builder: CustomResponsive.build,
        theme: CustomDarkTheme().themeData,
        darkTheme: CustomDarkTheme().themeData,
        themeMode: context.watch<ProductViewModel>().state.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    ); */
    return MaterialApp(
      title: 'FLUTTER MODULAR MVVM TEMPLATE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FLUTTER MODULAR MVVM TEMPLATE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
