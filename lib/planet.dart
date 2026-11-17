class Planet {
  final String name;
  final String tagline;
  final String image;
  final String model;
  final String about;
  final Map<String, String> facts;

  const Planet({
    required this.name,
    required this.tagline,
    required this.image,
    required this.model,
    required this.about,
    required this.facts,
  });
}

const planets = [
  Planet(
    name: 'Mercury',
    tagline: 'Mercury: The Swift Planet',
    image: 'assets/images/mercury.png',
    model: 'assets/models/mercury.glb',
    about: 'Mercury is the smallest planet and the closest to the Sun.',
    facts: {
      'Distance from Sun (km)': '57,900,000',
      'Length of day (hours)': '4222.6',
      'Orbital Period (Earth years)': '0.24',
      'Radius (km)': '2,439',
      'Gravity (m/s²)': '3.7',
    },
  ),
  Planet(
    name: 'Earth',
    tagline: 'Earth: Our Blue Marble',
    image: 'assets/images/earth.png',
    model: 'assets/models/earth.glb',
    about:
        'Earth is the only known planet in the universe that supports life, '
        'thanks to its liquid water, a breathable atmosphere, and a suitable '
        'distance from the Sun.',
    facts: {
      'Distance from Sun (km)': '149598026',
      'Length of Day (hours)': '23.93',
      'Orbital Period (Earth years)': '1',
      'Radius (km)': '6371',
      'Mass (kg)': '5.972 × 10²⁴',
      'Gravity (m/s²)': '9.81',
      'Surface Area (km²)': '5.10 × 10⁸',
    },
  ),
  Planet(
    name: 'Mars',
    tagline: 'Mars: The Red Planet',
    image: 'assets/images/mars.png',
    model: 'assets/models/mars.glb',
    about: 'Mars is a cold desert world with the tallest volcano in the solar system.',
    facts: {
      'Distance from Sun (km)': '227,900,000',
      'Length of day (hours)': '24.6',
      'Orbital Period (Earth years)': '1.88',
      'Radius (km)': '3,390',
      'Gravity (m/s²)': '3.7',
    },
  ),
];
