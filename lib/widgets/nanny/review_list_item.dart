import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/review.dart';
import 'package:my_cv_app/widgets/common/profile_photo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ReviewListItem extends StatelessWidget {
  final Review review;
  final bool line;
  ReviewListItem(this.review, this.line);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(radius: 20, child: FlutterLogo(),),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.id=='1'?'Joe Bloggs':'Rod Knee',
                    style: TextStyle(
                        color: ThemeColors.DARK_GRAY,
                        fontSize: ThemeSizes.SUBTITLE,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      RatingBar(
                        onRatingUpdate: null,
                        allowHalfRating: false,
                        ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: ThemeColors.YELLOW,
                            ),
                            empty: Icon(
                              Icons.star_border,
                              color: ThemeColors.YELLOW,
                            ),
                            half: Icon(Icons.star_half,
                                color: ThemeColors.YELLOW)),
                        initialRating: review.score,
                        itemSize: 24.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "19 July 2020",
                        style: TextStyle(
                            color: ThemeColors.GRAY_TEXT,
                            fontSize: ThemeSizes.PARAGRAPH),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            review.comments,
            style: TextStyle(
              color: ThemeColors.PRIMARY_TEXT,
              fontSize: ThemeSizes.PARAGRAPH,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          if (line)
            Container(
              width: double.infinity,
              height: 1,
              color: ThemeColors.GRAY_TEXT,
            )
        ],
      ),
    );
  }
}
