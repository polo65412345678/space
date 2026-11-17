import 'package:flutter/material.dart';
import 'main.dart';
import 'planet.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.75);
  int current = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void goTo(int page) {
    if (page < 0 || page >= planets.length) return;
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[current];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/space_bg.png', fit: BoxFit.cover),
          // Gradient فوق الصورة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kBlack, kBlack.withValues(alpha: 0.0), kBlack],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Text('Explore', style: titleLarge),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Which planet\nwould you like to explore?',
                        style: bodyLarge),
                  ),


                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: planets.length,
                      onPageChanged: (i) => setState(() => current = i),
                      itemBuilder: (_, i) {
                        return AnimatedBuilder(
                          animation: controller,
                          builder: (_, child) {
                            double page = controller.hasClients &&
                                controller.position.haveDimensions
                                ? controller.page!
                                : current.toDouble();
                            final scale =
                            (1 - (page - i).abs() * 0.3).clamp(0.7, 1.0);
                            return Transform.scale(scale: scale, child: child);
                          },
                          child: Image.asset(planets[i].image),
                        );
                      },
                    ),
                  ),

                  // الأسهم + اسم الكوكب
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circleArrow(Icons.arrow_back, () => goTo(current - 1)),
                      Text(planet.name, style: titleLarge),
                      circleArrow(Icons.arrow_forward, () => goTo(current + 1)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // زرار Explore [الكوكب]
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: redButtonStyle(),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(planet: planet),
                        ),
                      ),
                      child: Text('Explore ${planet.name}'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}