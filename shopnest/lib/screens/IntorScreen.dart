import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Provider/Providers.dart';
import '../data/IntroScreenList.dart';

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
                effect: WormEffect(activeDotColor: Colors.greenAccent,
                  dotColor: Colors.grey,

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
            bottom: 30.h,
            child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap:(){
                    if(_currentindex<IntrocomponentList.length-1){
                      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                    }
                    else{

                    }
                  },
                  child: Container(
                    width: 300.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xff20c93b),
                      borderRadius: BorderRadius.circular(20),
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
