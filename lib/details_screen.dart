import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'main.dart';
import 'planet.dart';

class DetailsScreen extends StatelessWidget {
  final Planet planet;
  const DetailsScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/space_bg.png', fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kBlack.withValues(alpha: 0.0), kBlack],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: circleArrow(
                              Icons.arrow_back,
                                  () => Navigator.pop(context),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(planet.name, style: titleLarge),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              planet.tagline,
                              style: bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 343,
                width: double.infinity,
                child: planet.model != null
                    ? Flutter3DViewer(src: planet.model!)
                    : Image.asset(planet.image, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About', style: titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    planet.about,
                    style: bodyLarge.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  for (final e in planet.facts.entries)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '${e.key} : ${e.value}',
                        style: bodyLarge.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}