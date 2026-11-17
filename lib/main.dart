import 'package:flutter/material.dart';
import 'intro_screen.dart';

const kBlack = Color(0xFF0E0E0E);
const kRed = Color(0xFFEE403D);

void main() => runApp(const SpaceApp());

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kBlack),
      home: const IntroScreen(),
    );
  }
}

// زرار أحمر مشترك: padding 16 - elevation 0 - حواف دائرية
ButtonStyle redButtonStyle() => ElevatedButton.styleFrom(
  backgroundColor: kRed,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.all(16),
  elevation: 0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
);

// زرار السهم الدائري
Widget circleArrow(IconData icon, VoidCallback onTap) => ElevatedButton(
  onPressed: onTap,
  style: ElevatedButton.styleFrom(
    backgroundColor: kRed,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(12),
  ),
  child: Icon(icon, size: 22),
);

const titleLarge =
TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
const bodyLarge =
TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);