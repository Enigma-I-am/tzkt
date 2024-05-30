import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tzkt/core/services/navigation.service.dart';
import 'package:tzkt/counter/counter.dart';
import 'package:tzkt/counter/view/login_page.dart';
import 'package:tzkt/l10n/l10n.dart';
import 'package:tzkt/widgets/controller_bottom_nav.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlockCubit>(
          create: (BuildContext context) => BlockCubit(),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigator.key,
        
        theme: ThemeData(
          textTheme:GoogleFonts.interTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: white,
          ),
          scaffoldBackgroundColor: white,
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginPage(),
        // child: const LoginPage(),
      ),
    );
  }
}
