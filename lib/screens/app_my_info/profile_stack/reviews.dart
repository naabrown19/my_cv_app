import 'package:flutter/material.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/my_info/review_list_item.dart';
import 'package:provider/provider.dart';

class ReviewList extends StatelessWidget {
  final bool isNanny;
  final String nannyId;
  ReviewList({this.isNanny, this.nannyId});

  @override
  Widget build(BuildContext context) {
    MyInfo _myInfo;

    _myInfo = Provider.of<MyInfoProvider>(context, listen: false).myInfo;

    return _myInfo.reviews != null && _myInfo.reviews.length > 0
        ? Container(
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _myInfo.reviews.length,
              itemBuilder: (context, index) => ReviewListItem(
                  _myInfo.reviews[index],
                  index == _myInfo.reviews.length - 1 ? false : true),
            ),
          )
        : Text(
            AppLocalizations.of(context).translate('no_reviews'),
            textAlign: TextAlign.center,
          );
  }
}
