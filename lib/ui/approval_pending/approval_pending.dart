import 'package:buyer_shop/res/colors.dart';
import 'package:buyer_shop/ui/login/login.dart';
import 'package:buyer_shop/ui/utils/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalPending extends StatelessWidget {
  const ApprovalPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UiHelper.verticalSpacing(30),
          _buildUpperText(),
          Image.asset('assets/logo.png'),
          UiHelper.verticalSpacing(28),
          UiHelper.verticalSpacing(19),
          _buildBottomText(context),
        ],
      ),
    );
  }

  _buildBottomText(BuildContext context) {
    return Column(
      children: [
        Text(
          // translation(context).agriculture,
          'लुम्बिनी प्रदेश सरकार',
          // '  Ministry of Agriculture and Land Management ',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'कृषि तथा भूमि व्यवस्था मन्त्रालय',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(
            // translation(context).butwal,
            'पशुपन्छी तथा मत्स्य बिकास निर्देशनालय ',
            //  '  Development',
            style: const TextStyle(
              color: AppColors.textRedColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'कृमुकाम, बुटवल',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textRedColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'फोन नं.: ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textRedColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '०७१४२०४३४, ०७१४२०४३५, ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(
          ' ०७१४२०४३६ ',
          //      'Directorate of Livestock and Fisheries',
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'इमेल: ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textRedColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '   dolfdp5@gmail.com ',
              //      'Directorate of Livestock and Fisheries',
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(30.h),
        SizedBox(
          width: 340.w,
          height: 48.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                  (route) => false,
                );
                // )
              },
              child: Text(
                'Proceed',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        // ०७१४२०४३६
      ],
    );
  }

  _buildUpperText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UiHelper.verticalSpacing(60),
        const Text(
          'तपाईंको फारम पेश गरिएको छ',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        UiHelper.verticalSpacing(16),
        const Column(
          children: [
            Text(
              'कृपया सम्बन्धित अधिकारीले तपाईंको आवेदन स्वीकृत',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            Text(
              ' नगरेसम्म पर्खनुहोस्',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ],
        ),
        UiHelper.verticalSpacing(24),
      ],
    );
  }
}
