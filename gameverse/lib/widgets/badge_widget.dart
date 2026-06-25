import 'package:flutter/material.dart';
import '../services/game_service.dart';

class BadgeCard extends StatelessWidget {
  final GameBadge badge;
  final bool unlocked;

  const BadgeCard({super.key, required this.badge, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: unlocked
            ? const Color(0xFF1A1A2E).withValues(alpha: 0.8)
            : Colors.white.withValues(alpha: 0.05),
        border: Border.all(
          color: unlocked
              ? const Color(0xFFFFD700).withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.1),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Icon(
              badge.icon,
              size: 40,
              color: unlocked ? const Color(0xFFFFD700) : Colors.white24,
            ),
          const SizedBox(height: 8),
          Text(
            badge.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: unlocked ? Colors.white : Colors.white38,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            badge.description,
            style: TextStyle(
              fontSize: 11,
              color: unlocked ? Colors.white60 : Colors.white24,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class LevelBadge extends StatelessWidget {
  final int level;
  final int xp;
  final double progress;

  const LevelBadge({
    super.key,
    required this.level,
    required this.xp,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: const Color(0xFF0F3460).withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFF8C00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '$level',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LEVEL',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _getLevelTitle(level),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$xp XP',
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getLevelTitle(int level) {
    if (level >= 10) return 'Game Legend';
    if (level >= 7) return 'Veteran Player';
    if (level >= 5) return 'Skilled Gamer';
    if (level >= 3) return 'Regular Player';
    return 'Newcomer';
  }
}
