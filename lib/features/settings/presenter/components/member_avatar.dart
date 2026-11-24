import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/settings/data/settings_data.dart';

class MemberAvatar extends StatelessWidget {
  final SocialLink link;
  const MemberAvatar({super.key, required this.link});

  Future<void> open(BuildContext context) async {
    final opened = await launchUrl(
      Uri.parse(link.url),
      mode: LaunchMode.externalApplication,
    );
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open the link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => open(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  link.name[0].toUpperCase(),
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontFamily: FontFamily.audiowide,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  padding: .all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF0A66C2),
                    shape: .circle,
                  ),
                  child: const Text(
                    'in',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            link.name.split(' ').first,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 13,
              fontFamily: FontFamily.spaceGrotesk,
            ),
          ),
        ],
      ),
    );
  }
}
