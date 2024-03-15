import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_navigation_provider/bottom_navigayion_provider.dart';
import 'controller/details_provider/details_provider.dart';
import 'controller/favorite_provider/favorite_provider.dart';
import 'controller/home_provider/home_provider.dart';
import 'controller/rated_provider/rated_provider.dart';
import 'controller/search_provider/search_provider.dart';
import 'core/constant/theme.dart';
import 'view/screen/main/mian_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(
          create: (context) => BottomNavigationBarProvider()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
      ChangeNotifierProvider(create: (context) => DetailsProvider()),
      ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ChangeNotifierProvider(create: (context) => RatedProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
      debugShowCheckedModeBanner: false,
      title: 'Lumovies',
      theme: appTheme,
      home: const MainScreen(),
    );
  }
}
