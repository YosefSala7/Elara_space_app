// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/age-range.png
  AssetGenImage get ageRange =>
      const AssetGenImage('assets/icons/age-range.png');

  /// File path: assets/icons/age-range_7187713.png
  AssetGenImage get ageRange7187713 =>
      const AssetGenImage('assets/icons/age-range_7187713.png');

  /// File path: assets/icons/fi-rr-calendar.svg
  SvgGenImage get fiRrCalendar =>
      const SvgGenImage('assets/icons/fi-rr-calendar.svg');

  /// File path: assets/icons/iconsax-weight.svg
  SvgGenImage get iconsaxWeight =>
      const SvgGenImage('assets/icons/iconsax-weight.svg');

  /// File path: assets/icons/scale.png
  AssetGenImage get scale => const AssetGenImage('assets/icons/scale.png');

  /// List of all assets
  List<dynamic> get values => [
    ageRange,
    ageRange7187713,
    fiRrCalendar,
    iconsaxWeight,
    scale,
  ];
}

class $AssetsImgsGen {
  const $AssetsImgsGen();

  /// File path: assets/imgs/Frame 1.png
  AssetGenImage get frame1 => const AssetGenImage('assets/imgs/Frame 1.png');

  /// File path: assets/imgs/Rectangle 4.png
  AssetGenImage get rectangle4 =>
      const AssetGenImage('assets/imgs/Rectangle 4.png');

  /// File path: assets/imgs/earth.png
  AssetGenImage get earth => const AssetGenImage('assets/imgs/earth.png');

  /// File path: assets/imgs/jupiter.png
  AssetGenImage get jupiter => const AssetGenImage('assets/imgs/jupiter.png');

  /// File path: assets/imgs/mars.png
  AssetGenImage get mars => const AssetGenImage('assets/imgs/mars.png');

  /// File path: assets/imgs/mercury.png
  AssetGenImage get mercury => const AssetGenImage('assets/imgs/mercury.png');

  /// File path: assets/imgs/neptune.png
  AssetGenImage get neptune => const AssetGenImage('assets/imgs/neptune.png');

  /// File path: assets/imgs/saturn.png
  AssetGenImage get saturn => const AssetGenImage('assets/imgs/saturn.png');

  /// File path: assets/imgs/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/imgs/sun.png');

  /// File path: assets/imgs/uranus.png
  AssetGenImage get uranus => const AssetGenImage('assets/imgs/uranus.png');

  /// File path: assets/imgs/venus.png
  AssetGenImage get venus => const AssetGenImage('assets/imgs/venus.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    frame1,
    rectangle4,
    earth,
    jupiter,
    mars,
    mercury,
    neptune,
    saturn,
    sun,
    uranus,
    venus,
  ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/Rocket loader.json
  LottieGenImage get rocketLoader =>
      const LottieGenImage('assets/lotties/Rocket loader.json');

  /// File path: assets/lotties/falling-stars-background.json
  LottieGenImage get fallingStarsBackground =>
      const LottieGenImage('assets/lotties/falling-stars-background.json');

  /// List of all assets
  List<LottieGenImage> get values => [rocketLoader, fallingStarsBackground];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImgsGen imgs = $AssetsImgsGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
