import 'package:cash_management_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CacheManagementApp());
}

class CacheManagementApp extends StatelessWidget {
  const CacheManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '収支管理アプリ',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const HomeScreen());
  }
}
