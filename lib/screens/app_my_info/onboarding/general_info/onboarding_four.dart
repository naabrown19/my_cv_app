import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class NannyOnboardingFourScreen extends StatefulWidget {
  final MyInfo nanny;
  final Function nextPage;
  NannyOnboardingFourScreen(this.nanny, this.nextPage);
  @override
  _NannyOnboardingFourScreenState createState() =>
      _NannyOnboardingFourScreenState();
}

class _NannyOnboardingFourScreenState extends State<NannyOnboardingFourScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherLastNameController = TextEditingController();
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();

  bool _day = false;
  bool _month = false;
  bool _year = false;

  List<FocusNode> _focusNodes = [FocusNode(), FocusNode()];

  bool _imageSelected = false;
  int _nameStep = 0;
  int _lastNameStep = 0;
  // int _dayStep = 0;
  // int _monthStep = 0;
  // int _yearStep = 0;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      _startInput();
    });
    // _nameController.text = widget.nanny.firstName ?? '';
    // _lastNameController.text = widget.nanny.lastName ?? '';
    // _otherLastNameController.text = widget.nanny.secondLastName ?? '';
    // _dayController.text = widget.nanny.dateOfBirth?.day?.toString() ?? '';
    // _monthController.text = widget.nanny.dateOfBirth?.month?.toString() ?? '';
    // _yearController.text = widget.nanny.dateOfBirth?.year?.toString() ?? '';
  }

  void _startInput() {
    if (!_imageSelected) {
      setState(() {
        _imageSelected = true;
      });
      Future.delayed(Duration(milliseconds: 100)).then((value) {
        _startInput();
      });
    } else if (_nameController.text != widget.nanny.firstName) {
      setState(() {
        _nameController.text = widget.nanny.firstName.substring(0, _nameStep);
      });
      _nameStep += 1;
      Future.delayed(Duration(milliseconds: 70)).then((value) {
        _startInput();
      });
    } else if (_lastNameController.text != widget.nanny.lastName) {
      setState(() {
        _lastNameController.text =
            widget.nanny.lastName.substring(0, _lastNameStep);
      });
      _lastNameStep += 1;
      Future.delayed(Duration(milliseconds: 70)).then((value) {
        _startInput();
      });
    } else if (_dayController.text.length != 2) {
      _scrollController.animateTo(200,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      setState(() {
        _dayController.text = '19';
      });
      Future.delayed(Duration(milliseconds: 100)).then((value) {
        _startInput();
      });
    } else if (_monthController.text.length != 2) {
      setState(() {
        _monthController.text = '07';
      });
      Future.delayed(Duration(milliseconds: 100)).then((value) {
        _startInput();
      });
    } else if (_yearController.text.length != 4) {
      setState(() {
        _yearController.text = '1991';
      });
      Future.delayed(Duration(seconds: 1)).then((value) {
        widget.nextPage();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodes.forEach((fn) => fn?.dispose());
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('nanny_ob_four_title'),
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
                          .translate('nanny_ob_four_subtitle'),
                      style: TextStyle(
                        color: ThemeColors.GRAY_TEXT,
                        fontSize: ThemeSizes.SUBTITLE,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: _imageSelected
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/images/profile_pic.jpg'),
                          )
                        : CircleAvatar(
                            backgroundColor: ThemeColors.BACKGROUND_AVATAR,
                            radius: 80,
                            child: widget.nanny.profileImageUrl == null
                                ? Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 60,
                                  )
                                : ClipOval(
                                    child: Image.network(
                                    widget.nanny.profileImageUrl,
                                    fit: BoxFit.cover,
                                    width: 160.0,
                                    height: 160.0,
                                  )),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  ThemeSizes.BORDER_RADIUS)),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: AppLocalizations.of(context)
                                    .translate('name'),
                                labelText: AppLocalizations.of(context)
                                    .translate('name')),
                            onChanged: (val) {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  ThemeSizes.BORDER_RADIUS)),
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: AppLocalizations.of(context)
                                    .translate('last_name'),
                                labelText: AppLocalizations.of(context)
                                    .translate('last_name')),
                            onChanged: (val) {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  ThemeSizes.BORDER_RADIUS)),
                          child: TextFormField(
                            controller: _otherLastNameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: AppLocalizations.of(context)
                                    .translate('other_last_name'),
                                labelText: AppLocalizations.of(context)
                                    .translate('other_last_name')),
                            onChanged: (val) {},
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'DOB',
                              style: TextStyle(color: ThemeColors.GRAY_TEXT),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 60,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      ThemeSizes.BORDER_RADIUS)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _dayController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                    hintText: 'DD',
                                    labelText: 'DD'),
                                onChanged: (val) {
                                  if (val.length == 2) {
                                    _day = true;
                                    FocusScope.of(context)
                                        .requestFocus(_focusNodes[0]);
                                    if (_day && _month && _year) {}
                                  } else {
                                    _day = false;
                                  }
                                },
                              ),
                            ),
                            Text('/'),
                            Container(
                              width: 60,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      ThemeSizes.BORDER_RADIUS)),
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _monthController,
                                  focusNode: _focusNodes[0],
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: 'MM',
                                      labelText: 'MM'),
                                  onChanged: (val) {
                                    if (val.length == 2) {
                                      _month = true;
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[1]);
                                      if (_day && _month && _year) {}
                                    } else {
                                      _month = false;
                                    }
                                  }),
                            ),
                            Text('/'),
                            Container(
                              width: 120,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      ThemeSizes.BORDER_RADIUS)),
                              child: TextFormField(
                                  controller: _yearController,
                                  keyboardType: TextInputType.number,
                                  focusNode: _focusNodes[1],
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: 'YYYY',
                                      labelText: 'YYYY'),
                                  onChanged: (val) {
                                    if (val.length == 4) {
                                      _year = true;
                                      FocusScope.of(context).unfocus();
                                      if (_day && _month && _year) {}
                                    } else {
                                      _year = false;
                                    }
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
