import 'package:flutter/material.dart';

class Document {
  String id;
  String docTitle;
  String docSubtitle;
  String fileUrl;
  String status;
  String rejectionReason;
  DateTime dateSubmitted;
  bool isRequired;

  Document(
      {@required this.id,
      @required this.docTitle,
      this.docSubtitle,
      this.fileUrl,
      this.dateSubmitted,
      this.rejectionReason,
      this.status = 'to submit',
      this.isRequired=true});
}
