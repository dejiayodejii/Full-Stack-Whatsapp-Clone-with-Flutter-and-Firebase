import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_/common/utils/colors.dart';
import 'package:whatsapp_clone_/common/widgets/error.dart';
import 'package:whatsapp_clone_/common/widgets/loader.dart';
import 'package:whatsapp_clone_/features/auth/controller/auth_provider.dart';
import 'package:whatsapp_clone_/features/landing_page/landing_screen.dart';
import 'package:whatsapp_clone_/firebase_options.dart';
import 'package:whatsapp_clone_/home_screen.dart';
import 'package:whatsapp_clone_/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const HomeScreen();
            },
            error: (err, trace) {
              return ErrorScreen(
                error: err.toString(),
              );
            },
            loading: () => const Loader(),
          ),
    );
  }
}
