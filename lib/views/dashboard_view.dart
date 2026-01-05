import 'package:flutter/material.dart';
import 'package:inviter/views/widgets/event_card_widget.dart';
import 'package:inviter/views/widgets/event_tile_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  // Profile Avatar
                  Stack(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipOval(
                          child: Image.network(
                            "https://lh3.googleusercontent.com/aida-public/AB6AXuBi3NTBm4t9dOWhHH1j1I9PjgmAYNN4U7P47PsA72uoQT8KYPHSJLh0c6pwpMEFRGra2AnkCWRA7CRkhXcHRm9L9COnvaaMJV1rKJXuXPf0J3pYuXc0CI-i6hKNdrpdkS9xK_LRBHKvmfHpA96DDeRx5Ycxixo-kAlxV9ix7IqLQ4VKCDhp86sByeyvzu23DxWC8hGGcxhMqe9rfcZODvT5gdLgK5u-WOG-Yics8tJ6bpl3P0ZWg9ImD3Gh5wVFS9hIK0_TLsCClzU",
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: colorScheme.primary.withOpacity(0.1),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        colorScheme.primary),
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: colorScheme.primary.withOpacity(0.1),
                              child: Icon(Icons.person,
                                  color: colorScheme.onSurface),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: colorScheme.background,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Welcome Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back,",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        "Jessica",
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Search and Notification Buttons
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: colorScheme.onSurface,
                    onPressed: () {},
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        color: colorScheme.onSurface,
                        onPressed: () {},
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.05),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _DashboardTab(
                      label: "To Review",
                      selected: true,
                      colorScheme: colorScheme,
                    ),
                    _DashboardTab(
                      label: "Upcoming",
                      selected: false,
                      colorScheme: colorScheme,
                    ),
                    _DashboardTab(
                      label: "Past",
                      selected: false,
                      colorScheme: colorScheme,
                    ),
                  ],
                ),
              ),
            ),
            // Needs Action Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Text(
                    "Needs Action",
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "3",
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Cards (horizontal scroll) - fit in available space
            Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  EventCard(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "John's 30th Birthday Bash",
                    date: "Sat, Oct 28 • 8:00 PM",
                    host: "John D.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuC1oJB97VQp682JWQ9h2WYmckipYFZamci_qE-WEjKGe-0J11LF4ErrktQK2iuJ0eQzoQ36sTbBY8QkRWxCZg1YDS6sa364lh_zwmv4wmOoAs49K2-W79NnS0_yOS8rWhHhe8yycWDowvCUsjdskdQ6p7PEnv-5CiqxqgcaBQRNUVTi7hdqIw7NSiZl8BPylBb0nxh4qKRECnKwTMRHUTQrqSLHR0BMzrFpgdH6Aa28vQLWu5r170kRLS4c7pTxi_O5pw9lBE9330w",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuCBURI5s0TNSVSCPXslbLoC96xEWFOwRAnanR1xb98jcTpFgEeMt780HmlyafoRx3bzDBEa6A2JFoCgY4NeRJI4h25RhNARYC6G6Cyh-iOvI1y2QgwCHxLNQS6h74Im_lBT5bOKOjEOX-u2KlE_n5ItVemCh9T6ZJbtw2IicoAiVbJxjzYzjiz0rZuBEJkKd5kNByvTJLaYZEaC5oNzsmcGjCjvxukFDVVveO9VOSQq1Mqop_Z9rhBFAg2kXzkuoXSEZktACrzBwi4",
                    rsvp: "RSVP by Today",
                    rsvpColor: Colors.red,
                  ),
                  const SizedBox(width: 16),
                  EventCard(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "Sarah & Mike's Wedding",
                    date: "Nov 12 • 2:00 PM",
                    host: "Sarah W.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBQlm_xQN3D6kznTUFG0mxiSv0A6yd4HVR0kc2Hj5YqbAXK4E9PGN-jBXn6P3Wm6Idgw4GNxJ_2DURx-0KuPljWElenZjkmqtKX_96AGToxUri7dnkpXhklxenfItWFkc1KjzYLwbdU_CvxPn7P8hWEHJXCHqwIxGvIdW2Eet0V1iAbvkNasudU4a12JYy3oCjTSoWN2mqLDHzjmhgrChF1Xgvs-sFpNZLWsFzoXDv_lQVNH5MEPjCMZ7KHv8cuXMOtoyiMD-Wn7xM",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuB0DcYfBwkImhCcp4zYgnu2eo8I8JZ99IL0YcU5TTayoQfXBiYiKWlx8NeSQvOeF3ZxV_oXKUe_gGeMNyv1YbOvsgdj-jaHXEpmb8GL5kVzhWdpzfuDy2cWzpLWTiRdWX0X5OfOazlNCxgu8oKB3KZNGjmqo5tdHhDw7EhixGSqJtdUwJxpg10afZXhi9CU9NwE-_ELLAzUm2zKJ9ItaIpJZlRD7eyd5C908nI0_9_AHB3nd9hF_zqUlbatNPhmMyAkw5IYIIrV6Rg",
                    rsvp: "RSVP in 2 days",
                    rsvpColor: Colors.orange,
                  ),
                  const SizedBox(width: 16),
                  EventCard(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "Sarah & Mike's Wedding",
                    date: "Nov 12 • 2:00 PM",
                    host: "Sarah W.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBQlm_xQN3D6kznTUFG0mxiSv0A6yd4HVR0kc2Hj5YqbAXK4E9PGN-jBXn6P3Wm6Idgw4GNxJ_2DURx-0KuPljWElenZjkmqtKX_96AGToxUri7dnkpXhklxenfItWFkc1KjzYLwbdU_CvxPn7P8hWEHJXCHqwIxGvIdW2Eet0V1iAbvkNasudU4a12JYy3oCjTSoWN2mqLDHzjmhgrChF1Xgvs-sFpNZLWsFzoXDv_lQVNH5MEPjCMZ7KHv8cuXMOtoyiMD-Wn7xM",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuB0DcYfBwkImhCcp4zYgnu2eo8I8JZ99IL0YcU5TTayoQfXBiYiKWlx8NeSQvOeF3ZxV_oXKUe_gGeMNyv1YbOvsgdj-jaHXEpmb8GL5kVzhWdpzfuDy2cWzpLWTiRdWX0X5OfOazlNCxgu8oKB3KZNGjmqo5tdHhDw7EhixGSqJtdUwJxpg10afZXhi9CU9NwE-_ELLAzUm2zKJ9ItaIpJZlRD7eyd5C908nI0_9_AHB3nd9hF_zqUlbatNPhmMyAkw5IYIIrV6Rg",
                    rsvp: "RSVP in 44 days",
                    rsvpColor: Colors.orange,
                  ),
                ],
              ),
            ),
            // Upcoming events header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Text(
                    "Upcoming Events",
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "3",
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  EventTile(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "John's 30th Birthday Bash",
                    date: "Sat, Oct 28 • 8:00 PM",
                    host: "John D.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuC1oJB97VQp682JWQ9h2WYmckipYFZamci_qE-WEjKGe-0J11LF4ErrktQK2iuJ0eQzoQ36sTbBY8QkRWxCZg1YDS6sa364lh_zwmv4wmOoAs49K2-W79NnS0_yOS8rWhHhe8yycWDowvCUsjdskdQ6p7PEnv-5CiqxqgcaBQRNUVTi7hdqIw7NSiZl8BPylBb0nxh4qKRECnKwTMRHUTQrqSLHR0BMzrFpgdH6Aa28vQLWu5r170kRLS4c7pTxi_O5pw9lBE9330w",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuCBURI5s0TNSVSCPXslbLoC96xEWFOwRAnanR1xb98jcTpFgEeMt780HmlyafoRx3bzDBEa6A2JFoCgY4NeRJI4h25RhNARYC6G6Cyh-iOvI1y2QgwCHxLNQS6h74Im_lBT5bOKOjEOX-u2KlE_n5ItVemCh9T6ZJbtw2IicoAiVbJxjzYzjiz0rZuBEJkKd5kNByvTJLaYZEaC5oNzsmcGjCjvxukFDVVveO9VOSQq1Mqop_Z9rhBFAg2kXzkuoXSEZktACrzBwi4",
                    rsvp: "RSVP by Today",
                    rsvpColor: Colors.red,
                  ),
                  const SizedBox(width: 16),
                  EventTile(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "Sarah & Mike's Wedding",
                    date: "Nov 12 • 2:00 PM",
                    host: "Sarah W.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBQlm_xQN3D6kznTUFG0mxiSv0A6yd4HVR0kc2Hj5YqbAXK4E9PGN-jBXn6P3Wm6Idgw4GNxJ_2DURx-0KuPljWElenZjkmqtKX_96AGToxUri7dnkpXhklxenfItWFkc1KjzYLwbdU_CvxPn7P8hWEHJXCHqwIxGvIdW2Eet0V1iAbvkNasudU4a12JYy3oCjTSoWN2mqLDHzjmhgrChF1Xgvs-sFpNZLWsFzoXDv_lQVNH5MEPjCMZ7KHv8cuXMOtoyiMD-Wn7xM",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuB0DcYfBwkImhCcp4zYgnu2eo8I8JZ99IL0YcU5TTayoQfXBiYiKWlx8NeSQvOeF3ZxV_oXKUe_gGeMNyv1YbOvsgdj-jaHXEpmb8GL5kVzhWdpzfuDy2cWzpLWTiRdWX0X5OfOazlNCxgu8oKB3KZNGjmqo5tdHhDw7EhixGSqJtdUwJxpg10afZXhi9CU9NwE-_ELLAzUm2zKJ9ItaIpJZlRD7eyd5C908nI0_9_AHB3nd9hF_zqUlbatNPhmMyAkw5IYIIrV6Rg",
                    rsvp: "RSVP in 2 days",
                    rsvpColor: Colors.orange,
                  ),
                  const SizedBox(width: 16),
                  EventTile(
                    theme: theme,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    title: "Sarah & Mike's Wedding",
                    date: "Nov 12 • 2:00 PM",
                    host: "Sarah W.",
                    hostAvatar:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuBQlm_xQN3D6kznTUFG0mxiSv0A6yd4HVR0kc2Hj5YqbAXK4E9PGN-jBXn6P3Wm6Idgw4GNxJ_2DURx-0KuPljWElenZjkmqtKX_96AGToxUri7dnkpXhklxenfItWFkc1KjzYLwbdU_CvxPn7P8hWEHJXCHqwIxGvIdW2Eet0V1iAbvkNasudU4a12JYy3oCjTSoWN2mqLDHzjmhgrChF1Xgvs-sFpNZLWsFzoXDv_lQVNH5MEPjCMZ7KHv8cuXMOtoyiMD-Wn7xM",
                    image:
                        "https://lh3.googleusercontent.com/aida-public/AB6AXuB0DcYfBwkImhCcp4zYgnu2eo8I8JZ99IL0YcU5TTayoQfXBiYiKWlx8NeSQvOeF3ZxV_oXKUe_gGeMNyv1YbOvsgdj-jaHXEpmb8GL5kVzhWdpzfuDy2cWzpLWTiRdWX0X5OfOazlNCxgu8oKB3KZNGjmqo5tdHhDw7EhixGSqJtdUwJxpg10afZXhi9CU9NwE-_ELLAzUm2zKJ9ItaIpJZlRD7eyd5C908nI0_9_AHB3nd9hF_zqUlbatNPhmMyAkw5IYIIrV6Rg",
                    rsvp: "RSVP in 44 days",
                    rsvpColor: Colors.orange,
                  ),
                ],
              ),
            ),
            // Navigation bar
            _buildNavigationBar(colorScheme),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNavigationBar(ColorScheme colorScheme) {
    // return NavigationBarTheme(
    //   data: NavigationBarThemeData(
    //     indicatorColor: Colors.transparent, // or your theme
    //     labelTextStyle: MaterialStateProperty.all(
    //       Theme.of(context).textTheme.labelSmall,
    //     ),
    //     iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
    //       if (states.contains(MaterialState.selected)) {
    //         return IconThemeData(color: Theme.of(context).colorScheme.primary);
    //       }
    //       return IconThemeData(
    //           color: Theme.of(context).colorScheme.onSurfaceVariant);
    //     }),
    //   ),
    //   child: NavigationBar(
    //     selectedIndex: 0,
    //     destinations: const [
    //       NavigationDestination(icon: Icon(Icons.dashboard), label: 'Home'),
    //       NavigationDestination(icon: Icon(Icons.contacts), label: 'Contacts'),
    //       NavigationDestination(icon: Icon(Icons.event), label: 'Calendar'),
    //       NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
    //     ],
    //   ),
    // );
    return NavigationBar(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary.withOpacity(0.1),
      selectedIndex: 0,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.contacts),
          label: 'Contacts',
        ),
        NavigationDestination(
          icon: Icon(Icons.event),
          label: 'Calendar',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class _DashboardTab extends StatelessWidget {
  final String label;
  final bool selected;
  final ColorScheme colorScheme;

  const _DashboardTab({
    required this.label,
    required this.selected,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: selected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: selected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}


// class _EventCard extends StatelessWidget {
//   final ThemeData theme;
//   final ColorScheme colorScheme;
//   final TextTheme textTheme;
//   final String title;
//   final String date;
//   final String host;
//   final String hostAvatar;
//   final String image;
//   final String rsvp;
//   final Color rsvpColor;

//   const _EventCard({
//     required this.theme,
//     required this.colorScheme,
//     required this.textTheme,
//     required this.title,
//     required this.date,
//     required this.host,
//     required this.hostAvatar,
//     required this.image,
//     required this.rsvp,
//     required this.rsvpColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 260,
//       decoration: BoxDecoration(
//         color: colorScheme.surface,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
//         boxShadow: [
//           BoxShadow(
//             color: colorScheme.shadow.withOpacity(0.05),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Event Image
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.network(
//                   image,
//                   height: 100,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: rsvpColor.withOpacity(0.9),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     rsvp,
//                     style: textTheme.labelSmall?.copyWith(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: textTheme.titleMedium?.copyWith(
//                     color: colorScheme.onSurface,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.calendar_month,
//                         size: 16, color: colorScheme.onSurfaceVariant),
//                     const SizedBox(width: 4),
//                     Text(
//                       date,
//                       style: textTheme.bodySmall?.copyWith(
//                         color: colorScheme.onSurfaceVariant,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 12,
//                       backgroundImage: NetworkImage(hostAvatar),
//                       backgroundColor: colorScheme.primary.withOpacity(0.1),
//                     ),
//                     const SizedBox(width: 6),
//                     Text(
//                       "Hosted by $host",
//                       style: textTheme.bodySmall?.copyWith(
//                         color: colorScheme.onSurfaceVariant,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: colorScheme.primary,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 1,
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Accept",
//                           style: textTheme.labelLarge?.copyWith(
//                             color: colorScheme.onPrimary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           side: BorderSide(
//                             color: colorScheme.outline.withOpacity(0.2),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           "Decline",
//                           style: textTheme.labelLarge?.copyWith(
//                             color: colorScheme.onSurface,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
