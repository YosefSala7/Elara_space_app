import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:space_app/core/app_colors.dart';

class ShareCard extends StatefulWidget {
  final String planetName;
  final Image planetImage;
  final String weight;
  final String age;
  final String jumpMultiplier;

  const ShareCard({
    super.key,
    required this.planetName,
    required this.planetImage,
    required this.weight,
    required this.age,
    required this.jumpMultiplier,
  });

  @override
  State<ShareCard> createState() => _ShareCardState();
}

class _ShareCardState extends State<ShareCard> {
  final GlobalKey _cardKey = GlobalKey();

  bool _isProcessing = false;

  static const Color _pillColor = Color(0xFF2C2C2E);
  static const Color _borderColor = Color(0x99D9534F);
  static const Color _accentColor = Color(0xFFE53935);

  // Capture the visual card as PNG.
  Future<Uint8List?> _captureCard() async {
    try {
      await WidgetsBinding.instance.endOfFrame;

      final renderObject = _cardKey.currentContext?.findRenderObject();

      if (renderObject is! RenderRepaintBoundary) {
        return null;
      }

      final ui.Image image = await renderObject.toImage(pixelRatio: 3.0);

      try {
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

        return byteData?.buffer.asUint8List();
      } finally {
        image.dispose();
      }
    } catch (e) {
      debugPrint('Capture error: $e');
      return null;
    }
  }

  // Create temporary PNG file.
  Future<File?> _createImageFile() async {
    final bytes = await _captureCard();

    if (bytes == null) return null;

    final directory = await getTemporaryDirectory();

    final safePlanetName = widget.planetName.toLowerCase().replaceAll(
      RegExp(r'[^a-z0-9_-]'),
      '_',
    );

    final file = File('${directory.path}/planet_${safePlanetName}_share.png');

    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  // Download image to Gallery or Windows Downloads.
  Future<void> _downloadImage() async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final file = await _createImageFile();

      if (file == null) {
        throw Exception('Could not capture the image.');
      }

      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        await Gal.putImage(file.path);
      } else if (!kIsWeb && Platform.isWindows) {
        final downloadsDirectory = await getDownloadsDirectory();

        if (downloadsDirectory == null) {
          throw Exception('Downloads folder not found.');
        }

        final savedFile = File(
          '${downloadsDirectory.path}${Platform.pathSeparator}'
          'planet_${widget.planetName.toLowerCase()}_share.png',
        );

        await file.copy(savedFile.path);
      } else {
        throw UnsupportedError(
          'Image saving is not supported on this platform.',
        );
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Platform.isWindows
                ? context.tr('Image saved to Downloads successfully!')
                : context.tr('Image saved to Gallery successfully!'),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.trf('Download failed: {error}', {'error': e})),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  // Share the actual PNG image file.
  Future<void> _shareImage() async {
    if (_isProcessing) return;

    final shareText = context.trf('Check out my stats on {planet}! 🚀', {
      'planet': context.tr(widget.planetName),
    });
    final shareTitle = context.tr('My Space Stats');

    setState(() {
      _isProcessing = true;
    });

    try {
      final file = await _createImageFile();

      if (file == null) {
        throw Exception('Could not capture the image.');
      }

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path, mimeType: 'image/png')],
          text: shareText,
          title: shareTitle,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.trf('Sharing failed: {error}', {'error': e})),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Only this part will be captured.
            RepaintBoundary(
              key: _cardKey,
              child: _ShareVisualCard(
                planetName: widget.planetName,
                planetImage: widget.planetImage,
                weight: widget.weight,
                age: widget.age,
                jumpMultiplier: widget.jumpMultiplier,
              ),
            ),

            const SizedBox(height: 18),

            // Action buttons are outside RepaintBoundary.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ShareAction(
                  icon: Icons.camera_alt_outlined,
                  label: 'Instagram',
                  onTap: _shareImage,
                  isLoading: _isProcessing,
                ),

                _ShareAction(
                  icon: Icons.chat_bubble_outline,
                  label: 'WhatsApp',
                  onTap: _shareImage,
                  isLoading: _isProcessing,
                ),

                _ShareAction(
                  icon: Icons.file_download_outlined,
                  label: 'Download',
                  onTap: _downloadImage,
                  isLoading: _isProcessing,
                ),

                _ShareAction(
                  icon: Icons.more_horiz,
                  label: 'More',
                  onTap: _shareImage,
                  isLoading: _isProcessing,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// SHARE VISUAL CARD
// ==========================================

class _ShareVisualCard extends StatelessWidget {
  final String planetName;
  final Image planetImage;
  final String weight;
  final String age;
  final String jumpMultiplier;

  const _ShareVisualCard({
    required this.planetName,
    required this.planetImage,
    required this.weight,
    required this.age,
    required this.jumpMultiplier,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.34,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Main card container.
              Positioned(
                left: width * 0.055,
                right: width * 0.035,
                top: height * 0.135,
                bottom: height * 0.035,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0x99D9534F),
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.045,
                      vertical: height * 0.035,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title.
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            context.tr('Share'),
                            style: TextStyle(
                              color: const Color(0xFFE53935),
                              fontSize: width * 0.038,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.045),

                        // Subtitle.
                        Text(
                          context.trf('On {planet} you weigh', {
                            'planet': context.tr(planetName),
                          }),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: height * 0.025),

                        // Weight.
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.075,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Text(
                              context.tr('Kg'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.048,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.035),

                        // Information badges.
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _InfoBadge(text: age),

                            _InfoBadge(text: jumpMultiplier),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Selected planet image.
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  width: width * 0.29,
                  height: width * 0.29,
                  child: Image(
                    image: planetImage.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) {
                      return const Icon(
                        Icons.public,
                        color: Colors.white,
                        size: 80,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ==========================================
// INFO BADGE
// ==========================================

class _InfoBadge extends StatelessWidget {
  final String text;

  const _InfoBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ==========================================
// SHARE ACTION BUTTON
// ==========================================

class _ShareAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const _ShareAction({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
              child: Center(
                child: isLoading
                    ? const SizedBox(
                        width: 23,
                        height: 23,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Icon(icon, color: Colors.white, size: 31),
              ),
            ),

            const SizedBox(height: 7),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                context.tr(label),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
