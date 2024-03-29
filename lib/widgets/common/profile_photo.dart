import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({
    this.imageUrl,
    this.radius,
  });
  final String? imageUrl;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ThemeColors.BACKGROUND_AVATAR.withOpacity(0.2),
      radius: radius == null ? 20 : radius,
      child: imageUrl == null || imageUrl == ''
          ? FlutterLogo()
          : ClipOval(
              child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              width: (radius ?? 20) * 2,
              height: (radius ?? 20) * 2,
            )),
    );
  }
}
