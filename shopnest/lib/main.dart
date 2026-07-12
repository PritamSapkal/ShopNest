import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/SplashScreen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor:Colors.white,
            highlightColor: Colors.black,
              textTheme: TextTheme(
                titleMedium: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize:40.sp),
                titleSmall: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 20.sp),
              ),

          ),
         darkTheme: ThemeData.dark().copyWith(
           scaffoldBackgroundColor:Colors.black,
           highlightColor: Colors.white,
           textTheme: TextTheme(
             titleMedium: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize:40.sp),
             titleSmall: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 20.sp),
           ),
         ),
         themeMode: ThemeMode.system,
         home:Splashscreen(),
        );
      },
    );
  }
}