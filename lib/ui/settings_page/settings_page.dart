import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/forgot_password/forgot_password.dart';
import 'package:buyer_shop/ui/login/bloc/login_bloc.dart';
import 'package:buyer_shop/ui/login/bloc/login_state.dart';
import 'package:buyer_shop/ui/login/login.dart';
import 'package:buyer_shop/ui/utils/endpoints.dart';
import 'package:buyer_shop/ui/utils/preferences.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../support/support.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          'Settings',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w900,
              fontSize: 18.sp),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 24.w),
          child: Column(
            children: [
              UiHelper.verticalSpacing(63.h),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginSuccess &&
                      state.details.data?.document?.profilePicture != null) {
                    String profilePic =
                        state.details.data?.document?.profilePicture ?? '';
                    return CircleAvatar(
                      radius: 50.r,
                      backgroundImage:
                          NetworkImage(Endpoints.baseFile + profilePic),
                    );
                  } else {
                    return Image.asset('assets/avatar.png');
                  }
                },
              ),
              UiHelper.verticalSpacing(16),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginSuccess) {
                    return Text(
                      state.result.data?.userName ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.sp),
                    );
                  }
                  return Text(
                    'Lucas Scott',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),
                  );
                },
              ),
              UiHelper.verticalSpacing(47),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Forgot(),
                      ));
                },
                child: Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '     Reset Password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //   Image.asset('assets/right_button.png'),
                        ]),
                  ),
                ),
              ),
              UiHelper.verticalSpacing(20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Support()),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '     Support',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //   Image.asset('assets/right_button.png'),
                        ]),
                  ),
                ),
              ),
              UiHelper.verticalSpacing(20),
              InkWell(
                onTap: () async {
                  Preferences preferences = Preferences();
                  await preferences.removeAll();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: Card(
                  elevation: 2,
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '     Logout',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //   Image.asset('assets/right_button.png'),
                        ]),
                  ),
                ),
              ),
              UiHelper.verticalSpacing(20),
            ],
          ),
        ),
      ),
    );
  }

  _buildUpperText() {
    return Column(
      children: [
        const Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16),
        ),
        UiHelper.verticalSpacing(16),
      ],
    );
  }
}
