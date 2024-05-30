/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/elon_narrow.png
  AssetGenImage get elonNarrow =>
      const AssetGenImage('assets/images/png/elon_narrow.png');

  /// File path: assets/images/png/elon_wide.png
  AssetGenImage get elonWide =>
      const AssetGenImage('assets/images/png/elon_wide.png');

  /// List of all assets
  List<AssetGenImage> get values => [elonNarrow, elonWide];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/arrow_down.svg
  SvgGenImage get arrowDown =>
      const SvgGenImage('assets/images/svg/arrow_down.svg');

  /// File path: assets/images/svg/arrow_right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('assets/images/svg/arrow_right.svg');

  /// File path: assets/images/svg/arrow_up.svg
  SvgGenImage get arrowUp =>
      const SvgGenImage('assets/images/svg/arrow_up.svg');

  /// File path: assets/images/svg/back.svg
  SvgGenImage get back => const SvgGenImage('assets/images/svg/back.svg');

  /// File path: assets/images/svg/back_button.svg
  SvgGenImage get backButton =>
      const SvgGenImage('assets/images/svg/back_button.svg');

  /// File path: assets/images/svg/btc.svg
  SvgGenImage get btc => const SvgGenImage('assets/images/svg/btc.svg');

  /// File path: assets/images/svg/connect.svg
  SvgGenImage get connect => const SvgGenImage('assets/images/svg/connect.svg');

  /// File path: assets/images/svg/earn.svg
  SvgGenImage get earn => const SvgGenImage('assets/images/svg/earn.svg');

  /// File path: assets/images/svg/eth.svg
  SvgGenImage get eth => const SvgGenImage('assets/images/svg/eth.svg');

  /// File path: assets/images/svg/explore.svg
  SvgGenImage get explore => const SvgGenImage('assets/images/svg/explore.svg');

  /// File path: assets/images/svg/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/images/svg/eye.svg');

  /// File path: assets/images/svg/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/images/svg/notification.svg');

  /// File path: assets/images/svg/open_in_browser.svg
  SvgGenImage get openInBrowser =>
      const SvgGenImage('assets/images/svg/open_in_browser.svg');

  /// File path: assets/images/svg/portfolio.svg
  SvgGenImage get portfolio =>
      const SvgGenImage('assets/images/svg/portfolio.svg');

  /// File path: assets/images/svg/scan.svg
  SvgGenImage get scan => const SvgGenImage('assets/images/svg/scan.svg');

  /// File path: assets/images/svg/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/svg/search.svg');

  /// File path: assets/images/svg/share.svg
  SvgGenImage get share => const SvgGenImage('assets/images/svg/share.svg');

  /// File path: assets/images/svg/sht.svg
  SvgGenImage get sht => const SvgGenImage('assets/images/svg/sht.svg');

  /// File path: assets/images/svg/sol.svg
  SvgGenImage get sol => const SvgGenImage('assets/images/svg/sol.svg');

  /// File path: assets/images/svg/spend.svg
  SvgGenImage get spend => const SvgGenImage('assets/images/svg/spend.svg');

  /// File path: assets/images/svg/tzs.svg
  SvgGenImage get tzs => const SvgGenImage('assets/images/svg/tzs.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowDown,
        arrowRight,
        arrowUp,
        back,
        backButton,
        btc,
        connect,
        earn,
        eth,
        explore,
        eye,
        notification,
        openInBrowser,
        portfolio,
        scan,
        search,
        share,
        sht,
        sol,
        spend,
        tzs
      ];
}

class TzktAssets {
  TzktAssets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
