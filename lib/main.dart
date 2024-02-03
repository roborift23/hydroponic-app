import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydroponic_app/provider/h_provider.dart';
import 'package:provider/provider.dart';

import 'constants/style/themes.dart';
import 'screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => SensorDataProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: HomePage(),
    );
  }
}
