import 'package:fast8_techtest/blocs/bottom_nav_cubit.dart';
import 'package:fast8_techtest/blocs/explore_wellness_cubit.dart';
import 'package:fast8_techtest/blocs/home_cubit.dart';
import 'package:fast8_techtest/blocs/personal_info_cubit.dart';
import 'package:fast8_techtest/screens/home_screen.dart';
import 'package:fast8_techtest/services/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseLocal().openDB();
  await DatabaseLocal().createDummyProduct();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => PersonalInfoCubit(),
        ),
        BlocProvider(
          create: (context) => ExploreWellnessCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
