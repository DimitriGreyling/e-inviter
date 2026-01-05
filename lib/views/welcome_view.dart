import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends ConsumerStatefulWidget {
  const WelcomeView({super.key});

  @override
  ConsumerState<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends ConsumerState<WelcomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final backgroundColor = colorScheme.background;
    final cardColor = colorScheme.surface;
    final primaryColor = colorScheme.primary;
    final bool isDark = theme.brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Header / Logo
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.drafts, color: primaryColor),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'E-Invitations',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                // Carousel
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: const [
                      _WelcomeSlide(
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuApnKx7zfep4nusHyOpW6gUkZTdDfQgnFWYrg_-iDj62ih2DivNfz0OAySxU7TCtX21tsSNv_cVT-404ngeWuliIhFrJXa6h2TX-oWcAhlnb23HBYIAru8-4qKo_bUPShQ9lOMJVcZMjeehJFjx8buOIqVUhjTZMbVaF5mdwTYvovgU48AnQCVPAb8v7iic2R9HB7VU8C882HckLFi3E0QQ-Tyb_G0tWu4uqRJ1-fLmcntfDWbW4HVASeDQzeCUcZTlv9PDEGjOl24',
                        label: 'New',
                        title: 'Parties start here',
                        description:
                            'The easiest way to create stunning invites and get the party started in seconds.',
                      ),
                      _WelcomeSlide(
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBZGBSrMBUC_4kUWUIwpuyeEY2YE0e95ORYQhYWYjZFxL1NfaHzNd2IRL26Yn70mwyEb3AkAFPaAMabmI-0Uzvg_UcnitcNkZi7u2XbJxmW7CvIyVf1hXUx1no81Ip3po_3dI_34_OCbHfLboOJAgJEK1AVR8eE5DIt_yY2vZZxQCA1Q5E9XPqsrZI87RpFaoJeNR_isPheLUzJtB7Rj0I1Ul0e7JvYv8t6tJ2DI_VOoHZ26WvCjbL0OVsksa7Y0cxvv3gtzStDOns',
                        title: 'Track RSVPs instantly',
                        description:
                            'Know exactly who is coming in real-time with our smart tracking dashboard.',
                        isDarkImage: false,
                      ),
                      _WelcomeSlide(
                        imageUrl:
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuD5iyjo_XVbZ7Ayby24_74p4pK33VvpKQQqO3fkl0kgiqvKXOvZJ9QdXHzImuu3uYuFLGaZzGNhy7gLN_iturK7vu0MQJPsVGhaCrLhMFcYDB_f8XB6dsNMJAQQcx138bJS4iddGdusJZVJ5caa44ayQxpk23srGWRDMc8w_LasqOfuqHl4aHu8-Wi4QFWXx6P-elXaojH_TupBsg5_IP8KpgrFtm7AwCA-Ar8JfxqeN2XdoCjMb0nJ9kJ_eE3EcuZCBDMT-1zQI9w',
                        title: 'Join the celebration',
                        description:
                            'Connect with friends, manage your social calendar, and never miss an event.',
                      ),
                    ],
                  ),
                ),
                // Page Indicators
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final isActive = _currentPage == index;
                      return Row(
                        children: [
                          Container(
                            height: 8,
                            width: isActive ? 32 : 8,
                            decoration: BoxDecoration(
                              color:
                                  isActive ? primaryColor : colorScheme.outline,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          if (index < 2) const SizedBox(width: 8),
                        ],
                      );
                    }),
                  ),
                ),
                // Action Area
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 4,
                          ),
                          child: Text('Create Account',
                              style: theme.textTheme.labelLarge?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {
                            context.go('/home');
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            side: BorderSide(
                                color: isDark
                                    ? Colors.grey[700]!
                                    : Colors.grey[300]!),
                          ),
                          child: Text('Sign In',
                              style: theme.textTheme.labelLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  color: isDark
                                      ? Colors.grey[800]
                                      : Colors.grey[300])),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('Or continue with',
                                style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Expanded(
                              child: Divider(
                                  color: isDark
                                      ? Colors.grey[800]
                                      : Colors.grey[300])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIconButton(
                            icon: Image.asset('assets/google-logo.png',
                                width: 24, height: 24),
                          ),
                          const SizedBox(width: 24),
                          _SocialIconButton(
                            icon: Icon(Icons.apple,
                                color: isDark ? Colors.white : Colors.black,
                                size: 28),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'By continuing, you agree to our Terms of Service and Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeSlide extends StatelessWidget {
  final String imageUrl;
  final String? label;
  final String title;
  final String description;
  final bool isDarkImage;

  const _WelcomeSlide({
    required this.imageUrl,
    this.label,
    required this.title,
    required this.description,
    this.isDarkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final backgroundColor = colorScheme.background;
    final primaryColor = colorScheme.primary;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.15),
                      blurRadius: 16)
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: isDarkImage
                        ? [backgroundColor.withOpacity(0.9), Colors.transparent]
                        : [Colors.black.withOpacity(0.28), Colors.transparent],
                  ),
                ),
              ),
            ),
            if (label != null)
              Positioned(
                bottom: 24,
                left: 24,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(label!,
                      style: theme.textTheme.labelSmall?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.bold,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontSize: 14,
            fontFamily: 'Noto Sans',
          ),
        ),
      ],
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final Widget icon;
  const _SocialIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: colorScheme.shadow.withOpacity(0.05), blurRadius: 4)
        ],
      ),
      child: Center(child: icon),
    );
  }
}
