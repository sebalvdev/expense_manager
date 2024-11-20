import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NextPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double mediaWith = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      floatingActionButton: SizedBox(
        width: mediaWith,
        child: FloatingActionButton(
          onPressed: _nextPage,
          backgroundColor: Colors.blue,
          child: Icon(
            _currentIndex == _pages.length - 1
                ? Icons.check // Icono para "Finish"
                : Icons.arrow_forward, // Icono para "Next"
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PageContent extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const PageContent({
    super.key,
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Text(
          'You have reached the next page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
