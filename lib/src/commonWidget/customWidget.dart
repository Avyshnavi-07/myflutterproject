import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customText(
  String msg, {
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  TextOverflow overflow = TextOverflow.clip,
  required BuildContext context,
}) {
  if (style != null) {
    final fontSize = style.fontSize ?? Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14.0;
    style = style.copyWith(
      fontSize: fontSize - (fullWidth(context) <= 375 ? 2 : 0),
    );
  }

  return Text(
    msg,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
  );
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDimension(BuildContext context, double unit) {
  if (fullWidth(context) <= 360.0) {
    return unit / 1.3;
  } else {
    return unit;
  }
}

Image customImage(String? path, {BoxFit fit = BoxFit.contain}) {
  if (path == null || path.isEmpty) {
    // Return a placeholder image or an empty box if URL is null
    return Image.asset(
      'assets/images/placeholder.png', // Make sure this asset exists
      fit: fit,
    );
  }

  return Image(
    image: customAdvanceNetworkImage(path),
    fit: fit,
    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
      return Image.asset(
        'assets/images/placeholder.png', // Fallback image on load error
        fit: fit,
      );
    },
  );
}


ImageProvider customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

double getFontSize(BuildContext context, double size) {
  final scaleFactor = MediaQuery.of(context).textScaleFactor;
  if (scaleFactor < 1) {
    return getDimension(context, size);
  } else {
    return getDimension(context, size / scaleFactor);
  }
}

String getTypeImage(String type) {
  switch (type) {
    case 'Fighting':
      return 'assets/images/types/Fight.png';
    default:
      return 'assets/images/types/$type.png';
  }
}
