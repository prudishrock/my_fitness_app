import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String handle;
  final String goalLabel;
  final String levelLabel;
  final ImageProvider? avatarImage;
  final bool isVerified;
  final VoidCallback? onEditPressed;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.handle,
    required this.goalLabel,
    required this.levelLabel,
    this.avatarImage,
    this.isVerified = true,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    const double cardPadding = 24.0;
    const double borderRadius = 28.0;
    const double avatarSize = 80.0;
    const double badgeSize = 28.0;
    const double chipHeight = 32.0;
    const double chipSpacing = 12.0;
    const double buttonWidth = 160.0;
    const double buttonHeight = 42.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(cardPadding),
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar with Glow and Verification Badge
          Stack(
            children: [
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.4),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.25),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: avatarImage != null
                      ? Image(
                          image: avatarImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildPlaceholderAvatar();
                          },
                        )
                      : _buildPlaceholderAvatar(),
                ),
              ),
              // Verification Badge
              if (isVerified)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: badgeSize,
                    height: badgeSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          // Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          // Handle
          Text(
            handle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          // Chips Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Goal Chip (GAIN MUSCLE)
              Container(
                height: chipHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.4),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    goalLabel,
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: chipSpacing),
              // Level Chip (ADVANCED)
              Container(
                height: chipHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    levelLabel,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          // Edit Profile Button
          SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: OutlinedButton(
              onPressed: onEditPressed ??
                  () {
                    // TODO: Edit profile
                  },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderAvatar() {
    return Container(
      color: Colors.grey[800],
      child: const Icon(
        Icons.person,
        size: 40,
        color: Colors.grey,
      ),
    );
  }
}
