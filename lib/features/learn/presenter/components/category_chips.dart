import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/features/learn/presenter/components/video.dart';


class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.filters,
    required this.selected,
    required this.onSelected,
  });

  final List<VideoFilter> filters;
  final VideoFilter selected;
  final ValueChanged<VideoFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelSmall;
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final f = filters[i];
          final isSelected = f == selected;
          return GestureDetector(
            onTap: () => onSelected(f),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white10,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white24,
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: (style ?? const TextStyle()).copyWith(
                  color: isSelected ? AppColors.white : AppColors.secorndary,
                  fontWeight: FontWeight.w600,
                ),
                child: Text(f.label),
              ),
            ),
          );
        },
      ),
    );
  }
}
