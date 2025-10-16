import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTabsController extends GetxController {
  RxInt selectedIndex = 0.obs;
}

class ProfileTabsWidget extends StatelessWidget {
  final controller = Get.put(ProfileTabsController());

  // replace these with your PNG icon asset paths
  final String gridActive = 'assets/icons/grid_active.png';
  final String gridInactive = 'assets/icons/grid_inactive.png';
  final String calendarActive = 'assets/icons/calendar_active.png';
  final String calendarInactive = 'assets/icons/calender_inactive.png';

  ProfileTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // top tab bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Grid Tab
                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 0,
                  child: Image.asset(
                    controller.selectedIndex.value == 0
                        ? gridActive
                        : gridInactive,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                SizedBox(width: 160.w),
                // Calendar Tab
                GestureDetector(
                  onTap: () => controller.selectedIndex.value = 1,
                  child: Image.asset(
                    controller.selectedIndex.value == 1
                        ? calendarActive
                        : calendarInactive,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
          ),
        ),
       // SizedBox(height: 10.h),

        // content area
        Obx(() => controller.selectedIndex.value == 0
            ? _buildGridTab()
            : _buildScheduleTab()),
      ],
    );
  }

  /// Tab 1 — Grid Layout
  Widget _buildGridTab() {
    final List<String> imageList = [
      'assets/images/event1.png',
      'assets/images/event1.png',
      'assets/images/event1.png',
      'assets/images/event1.png',
      'assets/images/event1.png',
      'assets/images/event1.png',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150.h,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.people_alt, color: Colors.white, size: 12.sp),
                    SizedBox(width: 3.w),
                    Text(
                      "5.6k",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Tab 2 — Event Schedule Text
  Widget _buildScheduleTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date and Time Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date: 25-08-2025",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "11:00 PM",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Event Schedule is Live!",
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "We’re excited to announce the official schedule for our upcoming Event.\n\n"
                "Mark your calendars and get ready — it’s going to be an amazing experience! "
                "Stay tuned for more updates and don’t forget to share with your friends!",
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Pay \$2",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          RichText(
            text: TextSpan(
              text: "Go to Live Event: ",
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "https://fiverrzoom.zoom.us/j/86189047244?",
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Bottom Icons Row
          Row(
            children: [
              Icon(Icons.favorite_border, size: 22.sp),
              SizedBox(width: 4.w),
              Text("4.5M", style: GoogleFonts.inter(fontSize: 13.sp)),
              SizedBox(width: 20.w),
              Icon(Icons.chat_bubble_outline, size: 22.sp),
              SizedBox(width: 4.w),
              Text("25.2K", style: GoogleFonts.inter(fontSize: 13.sp)),
              SizedBox(width: 20.w),
              Icon(Icons.share_outlined, size: 22.sp),
              SizedBox(width: 4.w),
              Text("Share", style: GoogleFonts.inter(fontSize: 13.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
