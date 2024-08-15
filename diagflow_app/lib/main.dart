
import 'package:diagflow_app/config/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:provider/provider.dart';
import 'config/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DialogFlowtter dialogFlowtter = await DialogFlowtter.fromFile(
    path: 'assets/credentials.json',
  );
  runApp(
    MyApp(dialogFlowtter: dialogFlowtter),
  );
}

class MyApp extends StatelessWidget {
  final DialogFlowtter dialogFlowtter;

  MyApp({required this.dialogFlowtter});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(dialogFlowtter),
      child: MaterialApp.router(
        title: 'Aplicacion de Dialogflow',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
