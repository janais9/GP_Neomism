/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/activeBusinessIcon.svg
  SvgGenImage get activeBusinessIcon =>
      const SvgGenImage('assets/images/activeBusinessIcon.svg');

  /// File path: assets/images/activeHomeIcon.svg
  SvgGenImage get activeHomeIcon =>
      const SvgGenImage('assets/images/activeHomeIcon.svg');

  /// File path: assets/images/activeProfitIcon.svg
  SvgGenImage get activeProfitIcon =>
      const SvgGenImage('assets/images/activeProfitIcon.svg');

  /// File path: assets/images/activeReservationIcon.svg
  SvgGenImage get activeReservationIcon =>
      const SvgGenImage('assets/images/activeReservationIcon.svg');

  /// File path: assets/images/add_image.svg
  SvgGenImage get addImage => const SvgGenImage('assets/images/add_image.svg');

  /// File path: assets/images/bg.svg
  SvgGenImage get bg => const SvgGenImage('assets/images/bg.svg');

  /// File path: assets/images/businessIcon.svg
  SvgGenImage get businessIcon =>
      const SvgGenImage('assets/images/businessIcon.svg');

  /// File path: assets/images/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/images/camera.svg');

  /// File path: assets/images/card.svg
  SvgGenImage get card => const SvgGenImage('assets/images/card.svg');

  /// File path: assets/images/date.svg
  SvgGenImage get date => const SvgGenImage('assets/images/date.svg');

  /// File path: assets/images/drawer.svg
  SvgGenImage get drawer => const SvgGenImage('assets/images/drawer.svg');

  /// File path: assets/images/exit.svg
  SvgGenImage get exit => const SvgGenImage('assets/images/exit.svg');

  /// File path: assets/images/homeIcon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/images/homeIcon.svg');

  /// File path: assets/images/info.svg
  SvgGenImage get info => const SvgGenImage('assets/images/info.svg');

  /// File path: assets/images/language.svg
  SvgGenImage get language => const SvgGenImage('assets/images/language.svg');

  /// File path: assets/images/location.svg
  SvgGenImage get location => const SvgGenImage('assets/images/location.svg');

  /// File path: assets/images/lockLogo.png
  AssetGenImage get lockLogo =>
      const AssetGenImage('assets/images/lockLogo.png');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/logo1.png
  AssetGenImage get logo1 => const AssetGenImage('assets/images/logo1.png');

  /// File path: assets/images/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/images/logout.svg');

  /// File path: assets/images/logout2.svg
  SvgGenImage get logout2 => const SvgGenImage('assets/images/logout2.svg');

  /// File path: assets/images/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/images/notification.svg');

  /// File path: assets/images/notification2.svg
  SvgGenImage get notification2 =>
      const SvgGenImage('assets/images/notification2.svg');

  /// File path: assets/images/on1.png
  AssetGenImage get on1 => const AssetGenImage('assets/images/on1.png');

  /// File path: assets/images/on2.png
  AssetGenImage get on2 => const AssetGenImage('assets/images/on2.png');

  /// File path: assets/images/on3.png
  AssetGenImage get on3 => const AssetGenImage('assets/images/on3.png');

  /// File path: assets/images/paint.svg
  SvgGenImage get paint => const SvgGenImage('assets/images/paint.svg');

  /// File path: assets/images/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/images/profile.svg');

  /// File path: assets/images/profitIcon.svg
  SvgGenImage get profitIcon =>
      const SvgGenImage('assets/images/profitIcon.svg');

  /// File path: assets/images/reservationIcon.svg
  SvgGenImage get reservationIcon =>
      const SvgGenImage('assets/images/reservationIcon.svg');

  /// File path: assets/images/search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/search.svg');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// File path: assets/images/started_app.jpeg
  AssetGenImage get startedApp =>
      const AssetGenImage('assets/images/started_app.jpeg');

  /// List of all assets
  List<dynamic> get values => [
        activeBusinessIcon,
        activeHomeIcon,
        activeProfitIcon,
        activeReservationIcon,
        addImage,
        bg,
        businessIcon,
        camera,
        card,
        date,
        drawer,
        exit,
        homeIcon,
        info,
        language,
        location,
        lockLogo,
        logo,
        logo1,
        logout,
        logout2,
        notification,
        notification2,
        on1,
        on2,
        on3,
        paint,
        profile,
        profitIcon,
        reservationIcon,
        search,
        splashBg,
        startedApp
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
