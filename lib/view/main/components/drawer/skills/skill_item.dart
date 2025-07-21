import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String title;
  final String image;

  const SkillItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amberAccent.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(
                  Icons.code, // fallback icon
                  size: 20,
                  color: Colors.amberAccent,
                ),
          ),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
