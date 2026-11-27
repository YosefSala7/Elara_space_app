import 'package:flutter/material.dart';
import 'package:space_app/features/settings/data/utils/url_helper.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/settings/data/model/settings_data.dart';

class MemberAvatar extends StatelessWidget {
  final SocialLink link;
  const MemberAvatar({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openLink(context, link.url),
      child: Column(
        mainAxisSize: .min,
        children: [
          Stack(
            clipBehavior: .none,
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: AppColors.white.withValues(alpha: 0.1),
                  border: .all(
                    color: AppColors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  link.name[0].toUpperCase(),
                  style: TextStyle(
                    color: AppColors.white,
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
                  child: Text(
                    'in',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 11,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            link.name.split(' ').first,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontFamily: FontFamily.spaceGrotesk,
            ),
          ),
        ],
      ),
    );
  }
}
