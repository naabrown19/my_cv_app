import 'package:flutter/material.dart';
import 'package:my_cv_app/const/dummy_data.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/my_info/docs_container.dart';

class NannyOnboardingTwelveScreen extends StatelessWidget {
  final MyInfo nanny;
  final Function nextPage;
  NannyOnboardingTwelveScreen(this.nanny, this.nextPage);

  @override
  Widget build(BuildContext context) {
    final docs = dummyDocs;
    Future.delayed(Duration(seconds: 3)).then((value) {
      nextPage();
    });
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)
                          .translate('nanny_ob_twelve_title') ??
                      '',
                  style: TextStyle(
                      color: ThemeColors.SECONDARY,
                      fontSize: ThemeSizes.TITLE,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)
                          .translate('nanny_ob_twelve_subtitle') ??
                      '',
                  style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.SUBTITLE,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${docs.length} ${AppLocalizations.of(context).translate('docs_required')}',
                style: TextStyle(
                    fontSize: ThemeSizes.SUBTITLE,
                    color: ThemeColors.PRIMARY_TEXT),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (docs[index].isRequired) {
                    return DocsContainer(docs[index]);
                  }
                  return null;
                },
                itemCount: docs.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
