import 'package:flutter/material.dart';

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 24.0;
    const double rowHeight = 58.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Label (outside card)
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'PREFERENCES',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ),
        // Preferences Card
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1B2633),
                Color(0xFF0F1720),
                Color(0xFF0A0F16),
              ],
              stops: [0.0, 0.45, 1.0],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              SettingsRow(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    // TODO: handle notifications toggle
                  },
                  activeColor: Colors.cyanAccent,
                ),
                height: rowHeight,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.08),
              ),
              SettingsRow(
                icon: Icons.straighten,
                title: 'Units',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Metric',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                height: rowHeight,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.08),
              ),
              SettingsRow(
                icon: Icons.palette_outlined,
                title: 'Appearance',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Dark Neon',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                height: rowHeight,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.08),
              ),
              SettingsRow(
                icon: Icons.lock_outline,
                title: 'Privacy',
                trailing: Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.white.withOpacity(0.5),
                ),
                height: rowHeight,
                onTap: () {
                  // TODO: Navigate to privacy
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.08),
              ),
              SettingsRow(
                icon: Icons.help_outline,
                title: 'Help & Support',
                trailing: Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.white.withOpacity(0.5),
                ),
                height: rowHeight,
                onTap: () {
                  // TODO: Navigate to help
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final double height;
  final VoidCallback? onTap;

  const SettingsRow({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(0),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white.withOpacity(0.7),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
