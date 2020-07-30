import 'package:flutter/material.dart';
import 'package:my_cv_app/models/address.dart';
import 'package:my_cv_app/models/nanny.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/selected_address_fields.dart';
import '../../../../const/theme.dart';
import 'package:google_place/google_place.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NannyOnboardingFiveScreen extends StatefulWidget {
  final MyInfo nanny;
  final Function nextPage;
  NannyOnboardingFiveScreen(this.nanny, this.nextPage);
  @override
  _NannyOnboardingFiveScreenState createState() =>
      _NannyOnboardingFiveScreenState();
}

class _NannyOnboardingFiveScreenState extends State<NannyOnboardingFiveScreen> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  bool _addressEdited = false;
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  int _phoneStep = 0;
  int _addressStep = 0;
  String addressSearch = '7 Plas Penrhyn, Penr';

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace('AIzaSyBb3o3TifyAVSvr3OVO9FQv-urnX4GHUSc');
    _startInput();
  }

  void _startInput() {
    if (_phoneController.text != widget.nanny.phoneNo) {
      setState(() {
        _phoneController.text = widget.nanny.phoneNo.substring(0, _phoneStep);
        _phoneStep += 1;
      });
      Future.delayed(Duration(milliseconds: 70)).then((value) {
        _startInput();
      });
    } else if (_addressController.text.length != 20) {
      setState(() {
        _addressController.text = addressSearch.substring(0, _addressStep);
        _addressStep += 1;
      });
      autoCompleteSearch(_addressController.text);
      Future.delayed(Duration(milliseconds: 50)).then((value) {
        _startInput();
      });
    } else {
      _selectAddress(0);
      Future.delayed(Duration(seconds: 2)).then((value) {
        widget.nextPage();
      });
    }
  }

  void autoCompleteSearch(String value) async {
    setState(() {
      _addressEdited = true;
    });
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  Future<void> _selectAddress(int index) async {
    DetailsResponse result = await googlePlace.details.get(
        predictions[index].placeId,
        region: Localizations.localeOf(context).countryCode,
        language: Localizations.localeOf(context).languageCode);

    _addressController.text = '';

    widget.nanny.address = Address(
      placeId: predictions[index].placeId,
      formattedAddress: result.result.formattedAddress,
      number: result.result.addressComponents[0].shortName,
      street: result.result.addressComponents[1].shortName,
      region: result.result.addressComponents[2].shortName,
      city: result.result.addressComponents[3].longName,
      county: result.result.addressComponents[4].longName,
      country: result.result.addressComponents[5].longName,
      postcode: result
          .result
          .addressComponents[result.result.addressComponents.length - 1]
          .shortName,
    );

    result.result.addressComponents.forEach((element) {
      print(element.shortName);
      print(element.longName);
    });

    debugPrint(predictions[index].placeId);
    FocusScope.of(context).unfocus();
    predictions.clear();
    setState(() {
      _addressEdited = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context).translate('nanny_ob_five_title'),
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
                      .translate('nanny_ob_five_subtitle'),
                  style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.SUBTITLE,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(ThemeSizes.BORDER_RADIUS)),
                child: IntlPhoneField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  autoValidate: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: AppLocalizations.of(context).translate('phone'),
                      labelText:
                          AppLocalizations.of(context).translate('phone')),
                  initialCountryCode: 'MX',
                  onChanged: (val) {
                    if (val.number.length == 10) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Search Address",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              _addressEdited
                  ? Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(predictions[index].description),
                            onTap: () => _selectAddress(index),
                          );
                        },
                      ),
                    )
                  : SelectedAddressField(widget.nanny.address)
            ],
          ),
        ),
      ),
    );
  }
}
