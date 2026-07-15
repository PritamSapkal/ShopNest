import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Provider/Providers.dart';
import '../data/IntroScreenList.dart';
import 'SignInPage.dart';

class Intorscreen extends ConsumerWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _currentindex = ref.watch(IntroIndexProvider);
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: IntrocomponentList.length,
            itemBuilder: ((context, index) {
              return IntrocomponentList[index];
            }),
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              ref.read(IntroIndexProvider.notifier).update((state) => index);
            },
          ),
          // Smooth Page Indicator
          Positioned(
            bottom: 110.h,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: IntrocomponentList.length,
                effect: WormEffect(activeDotColor: Colors.green,
                  dotColor: Colors.grey,
                  radius: 10,
                  dotHeight: 13,dotWidth: 13
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          //NextButton
          Positioned(
            bottom: 40.h,
            child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap:(){
                    if(_currentindex<IntrocomponentList.length-1){
                      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInpage()));
                    }
                  },
                  child: Container(
                    width: 300.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF2ECC71).withOpacity(0.4), // Match your gradient color with opacity
                            blurRadius: 15, // High blur gives that soft "lighting" effect
                            spreadRadius: 1, // How far the glow extends
                            offset: const Offset(0, 5), // Moves the glow slightly downwards
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF52C47E), // Lighter green
                            Color(0xFF3CA88B), // Cyan/Teal green
                          ],
                          begin: AlignmentGeometry.centerLeft,
                          end: AlignmentGeometry.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                        child: Text(
                      _currentindex == IntrocomponentList.length - 1
                          ? "Finish"
                          : "Next", style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),)),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
