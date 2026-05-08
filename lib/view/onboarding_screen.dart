import 'package:everest_food_app/view/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding content
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/welcome.png",
      "title": "Freshness from the Peaks",
      "description":
          "Experience the authentic taste of Everest delivered straight to your doorstep.",
    },
    {
      "image": "assets/images/delivery.png",
      "title": "Lightning Fast Delivery",
      "description":
          "Our riders are as fast as the mountain wind. Your food stays hot and fresh.",
    },
    {
      "image": "assets/images/payment.png",
      "title": "Easy & Secure Payments",
      "description":
          "Pay with ease using local wallets or cards. Secure and seamless transactions.",
    },
  ];

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // ✅ Prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _navigateToLogin,
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),

            // PageView
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) => _buildPageContent(index),
              ),
            ),

            // Bottom Section
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => _buildDot(index),
                      ),
                    ),
                    const Spacer(),

                    // Next / Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage >= _onboardingData.length - 1) {
                            _navigateToLogin(); // ✅ Works now
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFff7918),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _currentPage >= _onboardingData.length - 1
                              ? "Get Started"
                              : "Next",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Page Content
  Widget _buildPageContent(int index) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Circle
          Container(
            height: 280,
            decoration: const BoxDecoration(
              color: Color(0xFFfff3e0),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                _onboardingData[index]['image']!,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            _onboardingData[index]['title']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            _onboardingData[index]['description']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Dot Indicator
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 10,
      width: _currentPage == index ? 25 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFFff7918)
            : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
