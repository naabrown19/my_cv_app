import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/nanny.dart';
import 'package:my_cv_app/providers/nanny_data.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:provider/provider.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyInfo _myInfo = Provider.of<MyInfoProvider>(context).nanny;
    String _nannyName =
        '${_myInfo.firstName ?? 'Update Name'} ${_myInfo.lastName ?? ''} ${_myInfo.secondLastName ?? ''}';

    return Container(
      margin: EdgeInsets.symmetric(vertical: ThemeSizes.MARGIN / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_myInfo.approved)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/validate-icon.png',
                        height: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context).translate('verified'),
                        style: TextStyle(
                            color: ThemeColors.PRIMARY,
                            fontSize: ThemeSizes.CAPTION),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _nannyName,
                      style: TextStyle(
                        fontSize: ThemeSizes.SUBTITLE,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text('${_myInfo.phoneIso}-${_myInfo.phoneNo},\n${_myInfo.email}', style: TextStyle(color: ThemeColors.DARK_GRAY),)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.developer_mode,
                      color: ThemeColors.SECONDARY,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _myInfo.serviceCount.toString(),
                      style: TextStyle(color: ThemeColors.PRIMARY_TEXT),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      Icons.star,
                      color: ThemeColors.SECONDARY,
                      size: 24,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      _myInfo.averageReviewRating?.toStringAsFixed(1) ?? '5.0',
                      style: TextStyle(color: ThemeColors.PRIMARY_TEXT),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
