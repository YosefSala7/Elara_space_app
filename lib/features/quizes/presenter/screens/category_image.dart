import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';



/// Category artwork with an icon fallback when the asset is missing.
class CategoryImage extends StatelessWidget {
  const CategoryImage({
    super.key,
    required this.categoryId,
    required this.image,
    this.size = 72,
  });

  final String categoryId;
  final String image;
  final double size;

  static const _icons = <String, IconData>{
    'solar_system': Icons.wb_sunny_outlined,
    'planets': Icons.public,
    'moons': Icons.nightlight_round,
    'stars_galaxies': Icons.auto_awesome,
    'exploration': Icons.rocket_launch_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        color: AppColors.primary.withValues(alpha: 0.12),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            _icons[categoryId] ?? Icons.help_outline,
            size: size * 0.45,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
