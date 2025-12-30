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
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontGen {
  const $AssetsFontGen();

  /// File path: assets/font/Gilroy-Regular.ttf
  String get gilroyRegular => 'assets/font/Gilroy-Regular.ttf';

  /// File path: assets/font/Gilroy-SemiBold.ttf
  String get gilroySemiBold => 'assets/font/Gilroy-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [gilroyRegular, gilroySemiBold];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ic_about.svg
  SvgGenImage get icAbout => const SvgGenImage('assets/icon/ic_about.svg');

  /// File path: assets/icon/ic_bell.svg
  SvgGenImage get icBell => const SvgGenImage('assets/icon/ic_bell.svg');

  /// File path: assets/icon/ic_carrot.svg
  SvgGenImage get icCarrot => const SvgGenImage('assets/icon/ic_carrot.svg');

  /// File path: assets/icon/ic_carrot_color.svg
  SvgGenImage get icCarrotColor =>
      const SvgGenImage('assets/icon/ic_carrot_color.svg');

  /// File path: assets/icon/ic_cart.svg
  SvgGenImage get icCart => const SvgGenImage('assets/icon/ic_cart.svg');

  /// File path: assets/icon/ic_creditcard.svg
  SvgGenImage get icCreditcard =>
      const SvgGenImage('assets/icon/ic_creditcard.svg');

  /// File path: assets/icon/ic_explore.svg
  SvgGenImage get icExplore => const SvgGenImage('assets/icon/ic_explore.svg');

  /// File path: assets/icon/ic_facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icon/ic_facebook.svg');

  /// File path: assets/icon/ic_google.svg
  SvgGenImage get icGoogle => const SvgGenImage('assets/icon/ic_google.svg');

  /// File path: assets/icon/ic_heart.svg
  SvgGenImage get icHeart => const SvgGenImage('assets/icon/ic_heart.svg');

  /// File path: assets/icon/ic_id_card.svg
  SvgGenImage get icIdCard => const SvgGenImage('assets/icon/ic_id_card.svg');

  /// File path: assets/icon/ic_location.svg
  SvgGenImage get icLocation =>
      const SvgGenImage('assets/icon/ic_location.svg');

  /// File path: assets/icon/ic_order.svg
  SvgGenImage get icOrder => const SvgGenImage('assets/icon/ic_order.svg');

  /// File path: assets/icon/ic_pencill.svg
  SvgGenImage get icPencill => const SvgGenImage('assets/icon/ic_pencill.svg');

  /// File path: assets/icon/ic_promo.svg
  SvgGenImage get icPromo => const SvgGenImage('assets/icon/ic_promo.svg');

  /// File path: assets/icon/ic_question.svg
  SvgGenImage get icQuestion =>
      const SvgGenImage('assets/icon/ic_question.svg');

  /// File path: assets/icon/ic_store.svg
  SvgGenImage get icStore => const SvgGenImage('assets/icon/ic_store.svg');

  /// File path: assets/icon/ic_user.svg
  SvgGenImage get icUser => const SvgGenImage('assets/icon/ic_user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icAbout,
    icBell,
    icCarrot,
    icCarrotColor,
    icCart,
    icCreditcard,
    icExplore,
    icFacebook,
    icGoogle,
    icHeart,
    icIdCard,
    icLocation,
    icOrder,
    icPencill,
    icPromo,
    icQuestion,
    icStore,
    icUser,
  ];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/img_avatar.png
  AssetGenImage get imgAvatar =>
      const AssetGenImage('assets/img/img_avatar.png');

  /// File path: assets/img/img_background_onboarding_screen.png
  AssetGenImage get imgBackgroundOnboardingScreen =>
      const AssetGenImage('assets/img/img_background_onboarding_screen.png');

  /// File path: assets/img/img_banner1.png
  AssetGenImage get imgBanner1 =>
      const AssetGenImage('assets/img/img_banner1.png');

  /// File path: assets/img/img_banner2.png
  AssetGenImage get imgBanner2 =>
      const AssetGenImage('assets/img/img_banner2.png');

  /// File path: assets/img/img_banner3.png
  AssetGenImage get imgBanner3 =>
      const AssetGenImage('assets/img/img_banner3.png');

  /// File path: assets/img/img_logo_and_text.png
  AssetGenImage get imgLogoAndText =>
      const AssetGenImage('assets/img/img_logo_and_text.png');

  /// File path: assets/img/img_map_location.png
  AssetGenImage get imgMapLocation =>
      const AssetGenImage('assets/img/img_map_location.png');

  /// File path: assets/img/img_vegetables.png
  AssetGenImage get imgVegetables =>
      const AssetGenImage('assets/img/img_vegetables.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    imgAvatar,
    imgBackgroundOnboardingScreen,
    imgBanner1,
    imgBanner2,
    imgBanner3,
    imgLogoAndText,
    imgMapLocation,
    imgVegetables,
  ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/loading.json
  String get loading => 'assets/lotties/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

class Assets {
  const Assets._();

  static const $AssetsFontGen font = $AssetsFontGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImgGen img = $AssetsImgGen();
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
