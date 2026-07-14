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

          // Light Theme
          theme: ThemeData.light().copyWith(
            // 1. Removes the expanding ripple wave globally
              splashColor: Colors.transparent,

              // 2. Removes the instant tap overlay highlight globally
              highlightColor: Colors.transparent,
            scaffoldBackgroundColor:Colors.white,
            secondaryHeaderColor:Colors.white ,
            focusColor: Color(0xffF2F2F2),
            iconTheme:IconThemeData(
              color: Colors.black,
            ) ,
            textTheme: TextTheme(
                titleMedium: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize:40.sp),
                titleSmall: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 20.sp),
                headlineMedium: GoogleFonts.poppins(color:Colors.black87),
                headlineSmall: GoogleFonts.poppins(color: Colors.black87),
              ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black87,
              selectionColor: Colors.black87, // Color of the text highlight when selecting
              selectionHandleColor: Colors.black87, // Color of the little bubbles under the selection
            ),
             appBarTheme: AppBarThemeData(
               backgroundColor: Colors.white,
               elevation: 0.2,
               foregroundColor: Colors.white,
             ),
              bottomAppBarTheme: BottomAppBarThemeData(
                color:  Colors.white,
              )
          ),

         // Dark Theme
         darkTheme: ThemeData.dark().copyWith(
           // 1. Removes the expanding ripple wave globally
             splashColor: Colors.transparent,

             // 2. Removes the instant tap overlay highlight globally
             highlightColor: Colors.transparent,
           scaffoldBackgroundColor:Colors.black,
           secondaryHeaderColor: Color(0xff181818),
           focusColor: Color(0xff202020),
             iconTheme:IconThemeData(
               color: Colors.white,
             ) ,
           textTheme: TextTheme(
             titleMedium: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize:40.sp),
             titleSmall: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 20.sp),
             headlineMedium: GoogleFonts.poppins(color: Color(0xffF2F2F2)),
             headlineSmall: GoogleFonts.poppins(color: Colors.white),
           ),
           textSelectionTheme: const TextSelectionThemeData(
             cursorColor: Colors.grey,
             selectionColor: Colors.grey, // Color of the text highlight when selecting
             selectionHandleColor: Colors.grey, // Color of the little bubbles under the selection
           ),
           appBarTheme: AppBarThemeData(
             backgroundColor: Color(0xff181818),
             elevation: 0.2,
             foregroundColor: Color(0xff202020),
           ),
           bottomAppBarTheme: BottomAppBarThemeData(
             color:  Color(0xff181818),
           )
         ),

         // Theme Mode
         themeMode: ThemeMode.system,
         home:Splashscreen(),
        );
      },
    );
  }
}