import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/blocs/blocs.dart';
import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/ui/routes/routers.dart';

void main() async {
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
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService()),
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
      initialRoute: 'loading',
      routes: appRoutes,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.lightGreenAccent.shade700,
        ),
      ),
    );
  }
}
