import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp_animation/providers/nav_provider.dart';
import 'package:recipeapp_animation/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe Animation',
        home: const MainNav(),
      ),
    );
  }
}

