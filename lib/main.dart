import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/city_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/user_bloc.dart';
import 'package:mobile_development_test/presentation/pages/user_page.dart';
import 'injection.dart' as di;


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<CityBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const UserPage(),
      ),
    );
  }
}
