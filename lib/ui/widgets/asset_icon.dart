import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  /// The name of the icon as specified in the design file
  /// or in the 'assets/icons' folder.
  ///
  /// The name is case and character sensitive.
  /// The value of [icon] must not be `null`.
  final String icon;

  /// The preferred color of the icon.
  ///
  /// It defaults to the color in the current [IconTheme].
  final Color? color;

  /// The preferred size of the icon in logical pixels.
  ///
  /// It defaults to the size in the current [IconTheme].
  final double? size;

  /// Semantic label for the icon.
  ///
  /// It does not show up in the UI.
  final String? semanticLabel;

  /// Whether the icon has a dot.
  ///
  /// An example is the notification on the home screen.
  final bool? hasDot;

  /// The preferred color of the dot.
  ///
  /// It will be ignored of [hasDot] is false. It defaults to
  /// [Colors.orange].
  final Color dotColor;

  const AssetIcon({
    Key? key,
    required this.icon,
    this.color,
    this.size,
    this.semanticLabel,
    this.hasDot,
    this.dotColor: Colors.orange,
  })  : assert(icon != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    var iconTheme = IconTheme.of(context);
    var size = this.size ?? iconTheme.size;
    if (hasDot == true) {
      return Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: size,
            width: size,
            color: color ?? iconTheme.color,
            semanticsLabel: semanticLabel,
          ),
          Positioned(
            top: 1,
            right: 2,
            height: size! / 3,
            width: size / 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: this.dotColor,
              ),
            ),
          ),
        ],
      );
    }
    return SvgPicture.asset(
      "assets/icons/$icon.svg",
      height: size,
      width: size,
      color: color ?? iconTheme.color,
      semanticsLabel: semanticLabel,
    );
  }
}
