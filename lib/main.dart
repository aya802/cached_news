import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/home_screen.dart';

import 'cubit/news_cubit.dart';


void main() {
  runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsCubit(),
        child: const HomePage(),
      ),
    );
  }
}
