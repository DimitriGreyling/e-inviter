import 'package:flutter/material.dart';

class InvitationView extends StatelessWidget {
  const InvitationView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF191022) : const Color(0xFFF7F6F8);
    final cardColor = isDark ? const Color(0xFF191022) : Colors.white;
    final primaryColor = const Color(0xFF7f13ec);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, minHeight: 800),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 32,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(color: Colors.black.withOpacity(0.05), width: 2),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  // Status Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('9:41', style: TextStyle(fontWeight: FontWeight.w600)),
                        Row(
                          children: const [
                            Icon(Icons.signal_cellular_alt, size: 16),
                            SizedBox(width: 4),
                            Icon(Icons.wifi, size: 16),
                            SizedBox(width: 4),
                            Icon(Icons.battery_full, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: backgroundColor.withOpacity(0.8),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircleButton(icon: Icons.arrow_back, isDark: isDark),
                        Text('Invitation', style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                        _CircleButton(icon: Icons.ios_share, isDark: isDark),
                      ],
                    ),
                  ),
                  // Image Banner
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuD5iyjo_XVbZ7Ayby24_74p4pK33VvpKQQqO3fkl0kgiqvKXOvZJ9QdXHzImuu3uYuFLGaZzGNhy7gLN_iturK7vu0MQJPsVGhaCrLhMFcYDB_f8XB6dsNMJAQQcx138bJS4iddGdusJZVJ5caa44ayQxpk23srGWRDMc8w_LasqOfuqHl4aHu8-Wi4QFWXx6P-elXaojH_TupBsg5_IP8KpgrFtm7AwCA-Ar8JfxqeN2XdoCjMb0nJ9kJ_eE3EcuZCBDMT-1zQI9w'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [backgroundColor.withOpacity(0.8), Colors.transparent],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text('Upcoming', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Main Card
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: -32),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Summer', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Plus Jakarta Sans', color: isDark ? Colors.white : Colors.black)),
                                    Text('Rooftop Bash!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Plus Jakarta Sans', color: isDark ? Colors.white : Colors.black)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: isDark ? Colors.white.withOpacity(0.1) : Colors.grey[100]!),
                                  ),
                                  child: Column(
                                    children: const [
                                      Text('AUG', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
                                      Text('24', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Host
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.purple, primaryColor]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Center(child: Text('JD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF7f13ec)))),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hosted by', style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[400] : Colors.grey[500])),
                                    Text('Jane Doe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Details
                            _DetailTile(
                              icon: Icons.schedule,
                              title: 'Saturday, 8:00 PM',
                              subtitle: 'Add to calendar',
                              isDark: isDark,
                              primaryColor: primaryColor,
                            ),
                            const SizedBox(height: 8),
                            _DetailTile(
                              icon: Icons.location_on,
                              title: 'Skyline Lounge',
                              subtitle: '142 W 57th St, New York, NY',
                              isDark: isDark,
                              primaryColor: primaryColor,
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text('Map', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Divider(color: isDark ? Colors.grey[800] : Colors.grey[200]),
                            const SizedBox(height: 8),
                            // About Event
                            Text('About Event', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                            const SizedBox(height: 4),
                            Text(
                              "Join us for an unforgettable night under the stars! We'll have live jazz, signature cocktails, and a stunning view of the city skyline. Don't forget to wear your dancing shoes.",
                              style: TextStyle(fontSize: 14, color: isDark ? Colors.grey[400] : Colors.grey[500]),
                            ),
                            const SizedBox(height: 16),
                            // Attendees
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[100]!),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          _AvatarCircle(color: Colors.yellow[200]!),
                                          Positioned(left: 20, child: _AvatarCircle(color: Colors.blue[200]!)),
                                          Positioned(left: 40, child: _AvatarCircle(color: Colors.pink[200]!)),
                                        ],
                                      ),
                                      const SizedBox(width: 56),
                                      Text('+24 going', style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[300] : Colors.grey[600], fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  const Icon(Icons.chevron_right, color: Colors.grey, size: 24),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Bottom Action Bar
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                  decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(0.95),
                    border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!)),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                side: BorderSide(color: isDark ? Colors.grey[600]! : Colors.grey[300]!),
                              ),
                              child: Text("Can't Go", style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.grey[200] : Colors.grey[700], fontSize: 14)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 4,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('RSVP Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  SizedBox(width: 8),
                                  Icon(Icons.check_circle, size: 18, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Container(
                          height: 6,
                          width: 120,
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[700] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final bool isDark;
  const _CircleButton({required this.icon, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: isDark ? Colors.white : Colors.black),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isDark;
  final Color primaryColor;
  final Widget? trailing;
  const _DetailTile({required this.icon, required this.title, required this.subtitle, required this.isDark, required this.primaryColor, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: primaryColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isDark ? Colors.white : Colors.black)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[400] : Colors.grey[500])),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  final Color color;
  const _AvatarCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}
