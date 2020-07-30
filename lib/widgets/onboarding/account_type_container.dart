import 'package:flutter/material.dart';
import '../../const/theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AccountTypeContainer extends StatelessWidget {
  final Widget image;
  final String text;
  final Color color;
  AccountTypeContainer(this.text, this.image, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      height: kIsWeb ? MediaQuery.of(context).size.height*0.5 : 150,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(15.0),
      width: kIsWeb ? MediaQuery.of(context).size.width*0.2 : MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image,
          Text(
            text,
            style: TextStyle(
              color:
                  color == Colors.white ? ThemeColors.SECONDARY : Colors.white,
              fontSize: ThemeSizes.SUBTITLE,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
