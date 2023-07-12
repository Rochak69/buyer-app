import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_bloc.dart';
import 'package:buyer_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_event.dart';
import 'package:buyer_shop/ui/pending_request_per_listing/bloc/pending_request_per_listing_state.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
<<<<<<< HEAD
import 'package:buyer_shop/ui/utils/utils.dart';
=======
import 'package:buyer_shop/ui/your_listing/bloc/your_listing_bloc.dart';
import 'package:buyer_shop/ui/your_listing/bloc/your_listing_event.dart';
>>>>>>> ae2f4d86a3a2a1cafbeb12dfa744d077ab2738db
import 'package:buyer_shop/ui/your_listing/model/your_listing_model.dart';
import 'package:buyer_shop/ui/your_listing/repository/your_listing_api_client.dart';
import 'package:buyer_shop/ui/your_listing/your_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerRequestsScreen extends StatefulWidget {
  final String avgWeight;
  final String totalWeight;
  final String fishType;
  final String yeildDate;
  final List<FarmerRequest> farmerRequests;
  const BuyerRequestsScreen(
      {super.key,
      required this.avgWeight,
      required this.totalWeight,
      required this.fishType,
      required this.farmerRequests,
      required this.yeildDate});

  @override
  State<BuyerRequestsScreen> createState() => _BuyerRequestsScreenState();
}

class _BuyerRequestsScreenState extends State<BuyerRequestsScreen> {
  List<FarmerRequest> changeableRequest = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changeableRequest = widget.farmerRequests;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.textColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            '${widget.fishType} (${widget.avgWeight} के.जी)',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 20.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: _buildUpperText(context),
        ));
  }

  _buildUpperText(context) {
    return BlocConsumer<PendingRequestPerListingBloc,
        PendingRequestPerListingState>(
      listener: (context, state) {
        if (state is PendingRequestSuccess) {
          if (changeableRequest.isNotEmpty) {
            changeableRequest.removeAt(state.index);
            setState(() {});
            BlocProvider.of<YourListingBloc>(context).add(GetMyListings());
          }
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: RefreshIndicator(
              onRefresh: () => _refresh(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0.w),
                    child: Row(
                      children: [
                        Text(
                          translation(context).fish_weight,
                          // 'Fish weight : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          '${widget.avgWeight} के.जी',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Row(
                      children: [
                        Text(
                          // translation(context).total_weight,
                          'माछाको परिमाण के.जी: ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          '${widget.totalWeight} के.जी',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Row(
                      children: [
                        Text(
                          'खरिद गर्न मिति: ',
                          //   'Yeild Date : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          formarDate(widget.yeildDate),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  UiHelper.verticalSpacing(10.h),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 12.w),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'Expiration Date : ',
                  //         style: TextStyle(
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w700,
                  //             color: Colors.black),
                  //       ),
                  //       Text(
                  //         formarDate(widget.yeildDate),
                  //         style: TextStyle(
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w700,
                  //             color: AppColors.AppCardColor),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // UiHelper.verticalSpacing(12.h),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.only(bottom: 40.h),
                        itemBuilder: (context, index) => _buildSlverCrap(
                            context, changeableRequest[index], index),
                        separatorBuilder: (context, index) =>
                            UiHelper.verticalSpacing(23.h),
                        itemCount: changeableRequest.length),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildSlverCrap(context, FarmerRequest request, int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.cardContainerColor,
          borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.fishType} (${widget.avgWeight} kg)',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              UiHelper.verticalSpacing(4.h),
              Row(
                children: [
                  Text(
                    translation(context).fish_weight,
                    // 'Average weight : ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '${widget.avgWeight} के.जी',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'माछाको परिमाण के.जी: ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    '${widget.totalWeight} के.जी',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'माछा मारको मिति: ',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    formarDate(widget.yeildDate),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.AppCardColor),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  _showAcceptRejectDialog(context, request, true, index);
                },
                child: Container(
                  width: 91.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                        color: AppColors.textColor,
                        width: 1.5.w), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      'स्वीकार ',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor),
                    ),
                  ),
                ),
              ),
              UiHelper.verticalSpacing(5.h),
              InkWell(
                onTap: () {
                  _showAcceptRejectDialog(context, request, false, index);
                },
                child: Container(
                  width: 91.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        color: Colors.red,
                        width: 1.5.r), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      ' अस्वीकार',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textRedColor),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> _showAcceptRejectDialog(
      context, FarmerRequest request, bool isAccept, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0.r),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: EdgeInsets.symmetric(vertical: 12.h),
            title: Center(
              child: Text(
                isAccept
                    ? 'के तपाईं यो व्यक्तिको बिक्री आदेश स्वीकार गर्न              चाहनुहुन्छ ?'
                    : 'के तपाईं यो व्यक्तिको बिक्री आदेश अस्वीकार गर्न चाहनुहुन्छ ?',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   isAccept
                //       ? 'Are you sure, you want to  Accept?'
                //       : 'Are you sure, you want to  Reject?',
                //   style: TextStyle(fontSize: 12.sp),
                // ),
                Text(
                  'माछाको प्रजाती : ${widget.fishType}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  'माछाको आकार : ${widget.avgWeight} के.जी',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  'माछाको परिमाण के.जी : ${widget.totalWeight} के.जी',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  'माछा मारको मिति : ${formarDate(DateTime.now().toString())}',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                )
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  if (isAccept) {
                    BlocProvider.of<PendingRequestPerListingBloc>(context).add(
                        AcceptFarmerRequest(
                            id: request.id ?? '', index: index));
                  } else {
                    BlocProvider.of<PendingRequestPerListingBloc>(context).add(
                        RejectFarmerRequest(
                            id: request.id ?? '', index: index));
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                        color: AppColors.textColor), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.textColor),
                    ),
                  ),
                ),
              ),
              UiHelper.horizontalSpacing(15.w),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.textRedColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                        color:
                            AppColors.textRedColor), // Specify the border color
                  ),
                  child: Center(
                    child: Text(
                      'No',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> _refresh() async {}
}
