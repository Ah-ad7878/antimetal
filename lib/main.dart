import 'package:antimetal/HeroText.dart';
import 'package:antimetal/Navbar.dart';
import 'package:antimetal/graphic.dart';
import 'package:antimetal/page_two.dart';
import 'package:antimetal/text_with_graph.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NameBar();
  }
}

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antimetal',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 900;
    return Scaffold(
      backgroundColor: Color(0xFFD2D3C9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 40.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Navbar(),
                SizedBox(height: 60),
                isDesktop
                    ? const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(flex: 5, child: HeroTextSection()),
                          Expanded(flex: 6, child: GraphClass()),
                        ],
                      )
                    : const Column(
                        children: [
                          HeroTextSection(),
                          SizedBox(height: 40),
                          SizedBox(height: 350, child: GraphClass()),
                        ],
                      ),

                SizedBox(height: 100),
                Container(
                  width: double.infinity,
                  height: 0.07,
                  color: Colors.black,
                ),

                SizedBox(height: 10),
                PageTwo(),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 0.07,
                  color: Colors.black,
                ),

                SizedBox(height: 12),
                TextAndGraph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
