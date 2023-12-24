import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suitmedia_assignment/data/api/api_service.dart';
import 'package:suitmedia_assignment/data/preferences/preferences_helper.dart';
import 'package:suitmedia_assignment/presentations/first_screen.dart';
import 'package:suitmedia_assignment/presentations/second_screen.dart';
import 'package:suitmedia_assignment/presentations/third_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_assignment/provider/preferences_provider.dart';
import 'package:suitmedia_assignment/provider/userlist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider<UserListProvider>(
              create: (context) => UserListProvider(
                apiService: ApiService(),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => PreferencesProvider(
                preferencesHelper: PreferencesHelper(
                  sharedPreferences: SharedPreferences.getInstance(),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            home: const Scaffold(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/first',
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case FirstScreen.routeName:
                  return MaterialPageRoute(builder: (_) => const FirstScreen());
                case SecondScreen.routeName:
                  return MaterialPageRoute(
                    builder: (_) {
                      final String nama = settings.arguments as String;
                      return SecondScreen(
                        name: nama,
                      );
                    },
                  );
                case ThirdScreen.routeName:
                  return MaterialPageRoute(builder: (_) => const ThirdScreen());
              }
              return null;
            },
          ));
    });
  }
}
