import 'dart:io';

import 'package:buyer_shop/ui/home_listing/home_listing.dart';
import 'package:buyer_shop/ui/my_language/bloc/my_language_bloc.dart';
import 'package:buyer_shop/ui/my_language/bloc/my_language_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:buyer_shop/common/validator.dart';
import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/common_widget/FishTextField.dart';
import 'package:buyer_shop/ui/common_widget/app_dropdown.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_bloc.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_event.dart';
import 'package:buyer_shop/ui/fisher_farm_details/bloc/fish_farmer_detail_state.dart';
import 'package:buyer_shop/ui/login/login.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentificationDocuments extends StatefulWidget {
  final String userId;
  final String phoneNumber;
  final String comapnyName;
  final String buyerName;
  final String district;
  final String nagarpalika;
  final String woda;
  final String pradesh;
  final String? buisnessEmail;
  final String? buisnessName;
  final String? buisnessNumber;
  final String? number;

  const IdentificationDocuments(
      {super.key,
      required this.userId,
      required this.buyerName,
      required this.district,
      required this.nagarpalika,
      required this.woda,
      required this.pradesh,
      required this.phoneNumber,
      required this.comapnyName,
      this.buisnessEmail,
      this.buisnessName,
      this.buisnessNumber,
      this.number});

  @override
  State<IdentificationDocuments> createState() =>
      _IdentificationDocumentsState();
}

class _IdentificationDocumentsState extends State<IdentificationDocuments> {
  String selectedUnit = 'm';
  String? profilePicturePath;
  String? selectedDistrictId;
  String? citizenshipPicturePath;
  String? palikaPicturePath;
  String? othersPath;
  TextEditingController pondSize = TextEditingController();
  TextEditingController citizeName = TextEditingController();
  TextEditingController citizenNumber = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<FishFarmerDetailBloc>(context)
        .add(GetDistrict(provinceId: null));
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FishFarmerDetailBloc, FishFarmerDetailState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isPosted) {
          displayToastMessage('Farmer created successfully');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
            (route) => false,
          );
        } else if (state.theStates == TheStates.failed) {
          displayToastMessage(state.errorMessage,
              backgroundColor: AppColors.textRedContainerColor);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              // appBar: AppBar(
              //   automaticallyImplyLeading: false,
              //   centerTitle: true,
              //   elevation: 0,
              //   backgroundColor: Colors.white,
              //   title: Text(
              //     '',
              //     // 'Fish Farm Details',
              //     style: TextStyle(
              //         color: AppColors.textColor,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 22.sp),
              //   ),
              // ),
              body: SingleChildScrollView(
                  child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translation(context).citizenship_form_detials1,
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp),
                          ),
                          Text(
                            translation(context).citizenship_form_detials2,
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.sp),
                          ),
                          Text(
                            translation(context).citizenship_form_detials3,
                            style: TextStyle(
                                color: AppColors.textRedColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp),
                          ),
                          UiHelper.verticalSpacing(15.h),
                        ],
                      ),
                    ],
                  ),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).citizenship_name,
                        // 'Citizenship\'s name',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(textEditingController: citizeName, label: ''),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).citizenship_number,
                        //'Citizenship\'s Number',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      textEditingController: citizenNumber, label: ''),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).citizenship_place,
                        //'Citizenship\'s Location',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  BlocBuilder<MyLanguageBloc, MyLanguageState>(
                    builder: (context, languageState) {
                      return AppDropDown<String>(
                        value: selectedDistrictId,
                        isExpanded: true,
                        items: state.allDistrictResponse
                                ?.map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(state is EnglishState
                                        ? e.englishName ?? ''
                                        : e.nepaliName ?? '')))
                                .toList() ??
                            [],
                        onChanged: (value) {
                          selectedDistrictId = value;
                          setState(() {});
                        },
                      );
                    },
                  ),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).upload_document,
                        //'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp),
                        children: [
                          TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.sp))
                        ]),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(profilePicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            profilePicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                        child: const Text('Choose'),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).citizenship_upload,
                        //'Please upload your citizenship\'s picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(citizenshipPicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            citizenshipPicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                        child: const Text('Choose'),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  Text(
                    translation(context).no_citizenship,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  RichText(
                    text: TextSpan(
                        text: translation(context).ask_necessary_document,
                        // 'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(palikaPicturePath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            palikaPicturePath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                        child: const Text('Choose'),
                      )),
                  UiHelper.verticalSpacing(12.h),
                  Text(
                    translation(context).commpany_details,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp),
                  ),
                  RichText(
                    text: TextSpan(
                        text: translation(context).conpany_form_statement,
                        // 'Please upload your picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                        children: []),
                  ),
                  UiHelper.verticalSpacing(8.h),
                  FishTextField(
                      isReadOnly: true,
                      label: path.basename(othersPath ?? ''),
                      prefixIcon: ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.path ?? '');
                            if (file.path.isEmpty) {
                              displayToastMessage('Invalid file path',
                                  backgroundColor: AppColors.textRedColor);
                              return;
                            }
                            othersPath = file.path;
                            setState(() {});
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Set elevation to 0
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Change border radius to desired value
                            ),
                          ),
                        ),
                        child: const Text('Choose'),
                      )),
                  UiHelper.verticalSpacing(20.h),
                  SizedBox(
                    width: 330.w,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (profilePicturePath == null) {
                          displayToastMessage('Please upload profile picture',
                              backgroundColor: AppColors.textRedColor);
                          return;
                        }
                        showLoaderDialog(context);
                        BlocProvider.of<FishFarmerDetailBloc>(context).add(
                            PostBuyerDetailsEvent(
                                buisnessEmail: widget.buisnessEmail,
                                buisnessName: widget.buisnessName,
                                buisnessNumber: widget.buisnessNumber,
                                number: widget.number,
                                citizenshipIssueDistrict:
                                    selectedDistrictId ?? '1',
                                organizationName: widget.comapnyName,
                                profilePicture: profilePicturePath,
                                identification: othersPath,
                                citizenshipPhoto: citizenshipPicturePath,
                                registerPic: palikaPicturePath,
                                citizenName: citizeName.text,
                                citizenNumber: citizenNumber.text,
                                userId: widget.userId,
                                farmersName: widget.buyerName,
                                phoneNumber: widget.phoneNumber,
                                pradesh: widget.pradesh,
                                district: widget.district,
                                nagarpalika: widget.nagarpalika,
                                woda: int.tryParse(widget.woda) ?? 0));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                            0), // Set elevation to 0
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.r), // Change border radius to desired value
                          ),
                        ),
                      ),
                      child: const Text('Save'),
                    ),
                  ),
                  UiHelper.verticalSpacing(20.h),
                ],
              ),
            ),
          ))),
        );
      },
    );
  }
}
