import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/document.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class DocsContainer extends StatefulWidget {
  final Document doc;
  DocsContainer(this.doc);

  @override
  _DocsContainerState createState() => _DocsContainerState();
}

class _DocsContainerState extends State<DocsContainer> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if(widget.doc.docTitle=='cv'){
      Future.delayed(Duration(seconds: 1)).then((value) {
        setState(() {
          widget.doc.status='submitted';
        });
      });
    }
  }

  Color _getStatusColor() {
    Color color;
    switch (widget.doc.status) {
      case 'to submit':
        return color = ThemeColors.DARK_GRAY;
      case 'submitted':
        return color = Colors.green;
      case 'accepted':
        return color = Colors.green;
      case 'rejected':
        return color = Colors.red;
    }
    return color;
  }

  Widget _statusIconBuilder(BuildContext context, Document document) {
    Widget widget;
    if (_isLoading) {
      return CircularProgressIndicator();
    }
    switch (document.status) {
      case 'to submit':
        return widget = Icon(
          Icons.file_upload,
          color: _getStatusColor(),
        );

      case 'submitted':
        return widget = Icon(
          Icons.file_upload,
          color: _getStatusColor(),
        );
      case 'accepted':
        return widget = Icon(
          Icons.check_circle,
          color: _getStatusColor(),
        );
      case 'rejected':
        return widget = Icon(
          Icons.error,
          color: _getStatusColor(),
        );
    }
    return widget;
  }

  Future<void> _uploadDoc() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    widget.doc.status = 'submitted';
    widget.doc.dateSubmitted = DateTime.now();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _uploadDoc,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: _getStatusColor(), width: 2),
            color: _getStatusColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS)),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: ThemeSizes.MARGIN / 2),
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.doc.status == 'submitted')
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        AppLocalizations.of(context)
                            .translate(widget.doc.docTitle),
                        style: TextStyle(
                          color: ThemeColors.PRIMARY_DARK,
                          fontSize: ThemeSizes.SUBTITLE,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      AppLocalizations.of(context).translate(widget.doc.status),
                      style: TextStyle(color: _getStatusColor(), fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                    if (widget.doc.status == 'rejected')
                      Text(
                        AppLocalizations.of(context)
                                .translate('rejection_note') ??
                            widget.doc.rejectionReason,
                        style: TextStyle(
                            fontSize: ThemeSizes.CAPTION, color: Colors.red),
                      ),
                    if (widget.doc.docSubtitle != null)
                      Text(
                        AppLocalizations.of(context)
                                .translate(widget.doc.docTitle) ??
                            widget.doc.docSubtitle,
                        style: TextStyle(
                            fontSize: ThemeSizes.CAPTION,
                            color: ThemeColors.GRAY_TEXT),
                      ),
                    if (widget.doc.rejectionReason != null)
                      Text(
                        AppLocalizations.of(context)
                                .translate(widget.doc.rejectionReason) ??
                            widget.doc.rejectionReason,
                        style: TextStyle(
                            fontSize: ThemeSizes.CAPTION, color: Colors.red),
                      ),
                  ],
                )
              ],
            ),
            _statusIconBuilder(context, widget.doc)
          ],
        ),
      ),
    );
  }
}
