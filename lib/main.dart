import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:echnelapp/src/blocs/blocs.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/ui/routes/routers.dart';

void main() async {
  //? FIREBASE CONFIGS
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocationBloc()),
    ],
    child: AppState(),
  ));
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => FirebaseServices()),
        ChangeNotifierProvider(create: (_) => ViajesService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samella',
      initialRoute: 'login',
      routes: appRoutes,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.lightGreenAccent.shade700,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              // backgroundColor: Colors.lightGreenAccent.shade700,
              elevation: 0)),
    );
  }
}
