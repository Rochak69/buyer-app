import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/order_history/bloc/order_history_bloc.dart';
import 'package:buyer_shop/ui/order_history/bloc/order_history_event.dart';
import 'package:buyer_shop/ui/order_history/bloc/order_history_state.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:buyer_shop/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final int _selectedIndex = 0;

  // const ChooseNumberListView(),
  // const Messages(),
  // const ShowHelpView(),
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          translation(context).order_history,
          // 'Order History',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 22.sp),
        ),
      ),
      body: _buildUpperText(context),
    );
  }

  _buildUpperText(context) {
    return BlocConsumer<OrderHistoryBloc, OrderHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is OrderHistorysSuccess) {
          return RefreshIndicator(
            onRefresh: () => _refresh(),
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                itemBuilder: (context, index) =>
                    _buildSlverCrap(context, state, index),
                separatorBuilder: (context, index) =>
                    UiHelper.verticalSpacing(23.h),
                itemCount: state.orders.data?.length ?? 0),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildSlverCrap(context, OrderHistorysSuccess state, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
      decoration: BoxDecoration(
          color: AppColors.cardContainerColor,
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(width: 1.5.r, color: AppColors.cardContainerColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ID: ',
                //    'Fish weight : ',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                '${state.orders.data?[index].id?.substring(32)}',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.AppCardColor),
              ),
            ],
          ),
          Wrap(
            children: [
              Text(
                translation(context).fish_type,
                //'Fish Type : ',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor),
              ),
              Text(
                ' : ${state.orders.data?[index].fishType}',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.verticalSpacing(4.h),
                  Row(
                    children: [
                      Text(
                        translation(context).fish_weight,
                        //    'Fish weight : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        ' : ${state.orders.data?[index].avgFishWeight} के.जी',
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
                        translation(context).quantity,
                        //  'Qunatity : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        ' : ${state.orders.data?[index].requestedWeight}',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.AppCardColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'माछा बेच्ने व्यक्तिको नाम: ',

                        //  translation(context).yield_date,
                        //   'Yeild Date : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        '${state.orders.data?[index].farmerName}',
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
                        'माछा बेच्ने व्यक्ति व्यक्तिको ठेगाना: ',

                        //  translation(context).yield_date,
                        //   'Yeild Date : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        '${state.orders.data?[index].municipality}',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.AppCardColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'वडा : ',

                        //  translation(context).yield_date,
                        //   'Yeild Date : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        '${state.orders.data?[index].ward}',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.AppCardColor),
                      ),
                    ],
                  ),
                  state.orders.data?[index].streetName == null
                      ? SizedBox.shrink()
                      : Row(
                          children: [
                            Text(
                              'टोलको नाम : ',

                              //  translation(context).yield_date,
                              //   'Yeild Date : ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              '${state.orders.data?[index].streetName}',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.AppCardColor),
                            ),
                          ],
                        ),
                  InkWell(
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: state.orders.data?[index].phoneNumber ?? '',
                      );
                      await launchUrl(launchUri);
                    },
                    child: Row(
                      children: [
                        Text(
                          'सम्पर्क नम्बर: ',

                          //  translation(context).yield_date,
                          //   'Yeild Date : ',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          '${state.orders.data?[index].phoneNumber}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.AppCardColor),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'फेसबुक आईडी: ',

                        //  translation(context).buy_date,
                        //'Yeild Date : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        state.orders.data?[index].facebookPage ?? '',
                        //     '${state.orders.data?[index].ward?.nepaliNumber}',
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
                        'वेबसाइट: ',

                        //  translation(context).buy_date,
                        //'Yeild Date : ',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        state.orders.data?[index].website ?? '',
                        //     '${state.orders.data?[index].ward?.nepaliNumber}',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.AppCardColor),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Expire Date : ',
                  //       // 'Buyer\'s name : ',
                  //       style: TextStyle(
                  //           fontSize: 12.sp,
                  //           fontWeight: FontWeight.w700,
                  //           color: Colors.black),
                  //     ),
                  //     Text(
                  //       ' : ${formarDate(state.orders.data?[index].farmerSupply?.yieldDate)}',
                  //       style: TextStyle(
                  //           fontSize: 12.sp,
                  //           fontWeight: FontWeight.w700,
                  //           color: AppColors.AppCardColor),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         if (state.orders.data?[index].completed ?? false) {
              //           return;
              //         } else if (state.orders.data?[index].cancelled ?? false) {
              //           return;
              //         } else {
              //           _showSureDialog(context, state, index, true);
              //         }
              //       },
              //       child: Container(
              //         width: 91.w,
              //         height: 40.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12.r),
              //           border: Border.all(
              //               width: 1.5.w,
              //               color: AppColors
              //                   .textColor), // Specify the border color
              //         ),
              //         child: Center(
              //           child: Text(
              //             translation(context).completed,
              //             //   'Completed',
              //             style: TextStyle(
              //                 color: AppColors.textColor,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 12.sp),
              //           ),
              //         ),
              //       ),
              //     ),
              //     UiHelper.verticalSpacing(5.h),
              //     InkWell(
              //       onTap: () {
              //         if (state.orders.data?[index].cancelled ?? false) {
              //           return;
              //         } else if (state.orders.data?[index].completed ?? false) {
              //           return;
              //         } else {
              //           _showSureDialog(context, state, index, false);
              //         }
              //       },
              //       child: Container(
              //         width: 91.w,
              //         height: 40.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12.r),
              //           border: Border.all(
              //               color: Colors.red,
              //               width: 1.5.w), // Specify the border color
              //         ),
              //         child: Center(
              //           child: Text(translation(context).cancelled,
              //               //'Cancelled',
              //               style: TextStyle(
              //                 color: AppColors.textRedContainerColor,
              //                 fontSize: 12.sp,
              //                 fontWeight: FontWeight.w600,
              //               )),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }

  // Future<dynamic> _showSureDialog(
  //     context, OrderHistorysSuccess state, int index, bool isComplete) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           actionsAlignment: MainAxisAlignment.center,
  //           actionsPadding: EdgeInsets.symmetric(vertical: 12.h),
  //           title: Center(
  //             child: Text(
  //               isComplete
  //                   ? translation(context).mark_as_completed
  //                   : translation(context).marks_as_cancelled,
  //               //       'Mark as Completed',
  //               style: const TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w900),
  //             ),
  //           ),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   Text(
  //                     translation(context).fish_type,
  //                     //    'Fish Type : ',
  //                     style: TextStyle(
  //                         fontSize: 14.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: AppColors.textColor),
  //                   ),
  //                   Text(
  //                     ' : ${state.orders.data?[index].farmerSupply?.fishType?.name}',
  //                     style: TextStyle(
  //                         fontSize: 14.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                 ],
  //               ),
  //               UiHelper.verticalSpacing(4.h),
  //               Row(
  //                 children: [
  //                   Text(
  //                     translation(context).fish_weight,
  //                     //'Fish weight : ',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                   Text(
  //                     ' : ${state.orders.data?[index].farmerSupply?.avgFishWeight}',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: AppColors.AppCardColor),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     translation(context).quantity,
  //                     //   'Qunatity : ',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                   Text(
  //                     ' : ${state.orders.data?[index].farmerSupply?.totalWeight}',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w800,
  //                         color: AppColors.AppCardColor),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     'फोन नम्बर',
  //                     //   'Qunatity : ',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                   Text(
  //                     ' : ${state.orders.data?[index].phoneNumber}',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w800,
  //                         color: AppColors.AppCardColor),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     translation(context).yield_date,
  //                     //   'Yeild Date : ',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                   Text(
  //                     ' : ${formarDate(state.orders.data?[index].farmerSupply?.yieldDate)}',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: AppColors.AppCardColor),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Text(
  //                     translation(context).listing_expired,
  //                     //   'Yeild Date : ',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black),
  //                   ),
  //                   Text(
  //                     '7 days left',
  //                     style: TextStyle(
  //                         fontSize: 12.sp,
  //                         fontWeight: FontWeight.w700,
  //                         color: AppColors.AppCardColor),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           actions: [
  //             InkWell(
  //               onTap: () {
  //                 if (isComplete) {
  //                   if (state.orders.data?[index].completed ?? false) {
  //                     Navigator.pop(context);

  //                     displayToastMessage('Already Completed');
  //                     return;
  //                   }
  //                   BlocProvider.of<OrderHistoryBloc>(context)
  //                       .add(CompleteOfferEvent(state.orders.data?[index].id ??
  //                           ''
  //                               ''));
  //                   Navigator.pop(context);
  //                 } else {
  //                   if (state.orders.data?[index].cancelled ?? false) {
  //                     Navigator.pop(context);
  //                     displayToastMessage('Already Canceled');
  //                     return;
  //                   }
  //                   BlocProvider.of<OrderHistoryBloc>(context).add(RejectOffer(
  //                       state.orders.data?[index].farmerSupply?.fishTypeId ??
  //                           ''));
  //                   Navigator.pop(context);
  //                 }
  //               },
  //               child: Container(
  //                 width: 91.w,
  //                 height: 40.h,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(12.r),
  //                   border: Border.all(
  //                       color: AppColors.textColor), // Specify the border color
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     'Yes',
  //                     style: TextStyle(
  //                       fontSize: 12,
  //                       color: AppColors.textColor,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             UiHelper.horizontalSpacing(15.w),
  //             InkWell(
  //               onTap: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Container(
  //                 width: 91.w,
  //                 height: 40.h,
  //                 decoration: BoxDecoration(
  //                   color: AppColors.textRedColor,
  //                   borderRadius: BorderRadius.circular(12.r),
  //                   border: Border.all(
  //                     color: AppColors.textRedColor,
  //                   ), // Specify the border color
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     'No',
  //                     style: TextStyle(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  Future<void> _refresh() async {
    BlocProvider.of<OrderHistoryBloc>(context).add(GetOrderHistory());
  }
}
