import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../styles/pallete.dart';
import 'firebase_options.dart';
import '../router/router.dart';
import '../styles/snack_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Pallete.white, fontFamily: 'Poppins'),
      routerConfig: router,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
