import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mega_api/core/login_code.dart';


import 'auth_repo.dart';
import 'bloc/auth_bloc.dart';
import 'core/login_in/login_in.dart';
import 'dio_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              AuthRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(repo: RepositoryProvider.of<AuthRepo>(context)),
        child:const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginInPage(),
          // home: CodeScreen(),
        ),
      ),
    );
  }
}
