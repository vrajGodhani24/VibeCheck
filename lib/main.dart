import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibecheck/firebase_options.dart';
import 'package:vibecheck/utils/app_color.dart';
import 'package:vibecheck/views/homepage/screens/homepage.dart';
import 'package:vibecheck/views/splashscreen/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: AppColor.primaryColor)),
      initialRoute: 'splash',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/splash', page: () => const SplashScreen()),
      ],
    );
  }
}
