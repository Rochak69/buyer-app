import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/common_widget/CardListing.dart';
import 'package:buyer_shop/ui/common_widget/app_dropdown.dart';
import 'package:buyer_shop/ui/home_listing/bloc/home_listings_bloc.dart';
import 'package:buyer_shop/ui/home_listing/bloc/home_listings_event.dart';
import 'package:buyer_shop/ui/home_listing/bloc/home_listings_state.dart';
import 'package:buyer_shop/ui/login/bloc/login_bloc.dart';
import 'package:buyer_shop/ui/login/bloc/login_state.dart';
import 'package:buyer_shop/ui/settings_page/settings_page.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  String? selectedFish;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildUpperText(),
    );
  }

  _buildUpperText() {
    return BlocConsumer<HomeListingsBloc, HomeListingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeListingsSuccess) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Home',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                  child: BlocBuilder<HomeListingsBloc, HomeListingsState>(
                    builder: (context, state) {
                      if (state is HomeListingsSuccess &&
                          state.userDetails.data?.document?.profilePicture !=
                              null) {
                        String profilePic =
                            state.userDetails.data?.document?.profilePicture ??
                                '';
                        return CircleAvatar(
                          radius: 20.r,
                          backgroundImage:
                              NetworkImage(Endpoints.baseFile + profilePic),
                        );
                      } else {
                        return Image.asset('assets/avatar_small.png',
                            width: 38.w);
                      }
                    },
                  ),
                ),
                UiHelper.horizontalSpacing(24.w)
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () => refresh(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  UiHelper.verticalSpacing(12.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: AppDropDown<String>(
                              value: selectedFish,
                              onChanged: (p0) {
                                selectedFish = p0;
                                setState(() {});

                                BlocProvider.of<HomeListingsBloc>(context)
                                    .add(GetHomeListings(fishId: selectedFish));
                              },
                              items: state.fishes.data
                                      ?.map((e) => DropdownMenuItem(
                                          value: e.id,
                                          child: Text(e.name ?? '')))
                                      .toList() ??
                                  []),
                        ),
                        UiHelper.horizontalSpacing(10.w),
                        ElevatedButton(
                            onPressed: () {
                              selectedFish = null;
                              setState(() {});
                              BlocProvider.of<HomeListingsBloc>(context)
                                  .add(GetHomeListings());
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(
                                  0), // Set elevation to 0
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Change border radius to desired value
                                ),
                              ),
                            ),
                            child: Text(
                              'Clear Filters',
                              style: TextStyle(fontSize: 10.sp),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.only(top: 14.h),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CardListing(
                              expireDate:
                                  state.result.data?[index].expireDate ??
                                      'null',
                              avgWeight:
                                  state.result.data?[index].avgFishWeight ?? 0,
                              date: state.result.data?[index].yieldDate
                                      .toString() ??
                                  '',
                              fishName:
                                  state.result.data?[index].fishType?.name ??
                                      '',
                              totalWeight:
                                  state.result.data?[index].totalWeight ?? 0,
                              location: 'Kathmandu',
                              farmerSuppyId: state.result.data?[index].id ?? '',
                              isDisabled:
                                  state.result.data?[index].isDisabled ?? false,
                              expired:
                                  state.result.data?[index].expired ?? false,
                              fishId:
                                  state.result.data?[index].fishTypeId ?? '');
                        },
                        separatorBuilder: (context, index) =>
                            UiHelper.verticalSpacing(23.h),
                        itemCount: state.result.data?.length ?? 0),
                  )
                ]),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.textColor,
            ),
          );
        }
      },
    );
  }

  Future<void> refresh() async {
    selectedFish = null;
    setState(() {});
    BlocProvider.of<HomeListingsBloc>(context).add(GetHomeListings());
  }
}
