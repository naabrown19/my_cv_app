import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/address.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class SelectedAddressField extends StatefulWidget {
  final Address address;
  SelectedAddressField(this.address);
  @override
  _SelectedAddressFieldState createState() => _SelectedAddressFieldState();
}

class _SelectedAddressFieldState extends State<SelectedAddressField> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.apartment ?? '',
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText:
                        AppLocalizations.of(context).translate('apartment'),
                    labelText:
                        AppLocalizations.of(context).translate('apartment')),
                onChanged: (val) {
                  
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.number ?? '',
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: AppLocalizations.of(context).translate('number'),
                    labelText:
                        AppLocalizations.of(context).translate('number')),
                onChanged: (val) {
                  
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.street ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('street'),
                  labelText: AppLocalizations.of(context).translate('street'),
                ),
                onChanged: (val) {
                  
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.region ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('region'),
                  labelText: AppLocalizations.of(context).translate('region'),
                ),
                onChanged: (val) {
                 
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.city ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('city'),
                  labelText: AppLocalizations.of(context).translate('city'),
                ),
                onChanged: (val) {
                 
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.county ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('county'),
                  labelText: AppLocalizations.of(context).translate('county'),
                ),
                onChanged: (val) {
                  
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.country ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('country'),
                  labelText: AppLocalizations.of(context).translate('country'),
                ),
                onChanged: (val) {
                 
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
              ),
              child: TextFormField(
                initialValue: widget.address?.postcode ?? '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: AppLocalizations.of(context).translate('postcode'),
                  labelText: AppLocalizations.of(context).translate('postcode'),
                ),
                onChanged: (val) {
                 
                },
              ),
            ),
          ],
        ),
      
    );
  }
}
