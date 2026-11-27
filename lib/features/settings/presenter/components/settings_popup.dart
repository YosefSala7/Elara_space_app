import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/settings/data/model/settings_data.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'member_avatar.dart';

class SettingsPopup extends StatelessWidget {
  final SettingsData data;
  const SettingsPopup({super.key, required this.data});

  static void show(BuildContext context, SettingsData data) {
    showDialog(
      context: context,
      builder: (_) => SettingsPopup(data: data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: .symmetric(horizontal: 20),
        child: LiquidGlassLayer(
          settings: LiquidGlassSettings.ios27RegularDark(),
          child: LiquidGlass(
            shape: LiquidRoundedSuperellipse(borderRadius: 28),
            child: Padding(
              padding: .all(20),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.tr(data.title),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 22,
                            fontFamily: FontFamily.audiowide,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close_rounded, color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            context.tr(data.content),
                            style: TextStyle(
                              color: Colors.white70,
                              height: 1.2,
                              fontFamily: FontFamily.spaceGrotesk,
                            ),
                          ),
                          if (data.links.isNotEmpty) ...[
                            Row(
                              mainAxisAlignment: .spaceEvenly,
                              children: data.links
                                  .map((l) => MemberAvatar(link: l))
                                  .toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
