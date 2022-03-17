import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioWidget extends StatelessWidget {
  PortfolioWidget({
    Key key,
    this.title,
    this.links,
  }) : super(key: key);

  final String title;
  final List<Link> links;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ThemeColors.PRIMARY_TEXT,
            fontSize: ThemeSizes.SUBTITLE,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        ...links
            .map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${e.name}: '),
                    GestureDetector(
                      onTap: () =>
                          e.url == 'Coming Soon!' ? null : launch(e.url),
                      child: Text(
                        e.url,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: ThemeSizes.PARAGRAPH,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ))
            .toList(),
        const SizedBox(
          height: 8.0,
        )
      ],
    );
  }
}

class Link {
  Link(this.name, this.url);

  final String name;
  final String url;
}
