import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/route/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff3f4f9),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
