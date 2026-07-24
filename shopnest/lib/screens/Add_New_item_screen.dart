import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/DashBoardScreen.dart';
import 'package:shopnest/widgets/CustomeBackgroundContainer.dart';
import 'package:shopnest/widgets/GreenButton.dart';
import '../data/ItemCategory.dart';
import '../widgets/SuccessSnackBar.dart';
import '../widgets/TextButtonGreen.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';

class AddNewItemScreen extends StatelessWidget{
  AddNewItemScreen({required this.appbarTitle,super.key});
  final String appbarTitle;
  final  _addNewItemformkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Add shopping item Appbar
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          appbarTitle,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
        ),
      ),
      body:Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12,vertical: 15),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Form(
            key: _addNewItemformkey,
            child: Column(
              children: [
                //  First Container contains item name and the category  text bar
                Customebackgroundcontainer(childwidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Item Details Text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text("ITEM DETAILS",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:13.sp),),
                    ),

                    // Item Name Text Label
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Textfieldlabel(label: "Item Name *",fontsize: 11.sp,),
                    ),
                    // Item name Form Field
                    Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 5),
                        child: Textformfieldwidget(isObscure: false,hinttext: "       e.g. Organic Spinach",errormessage: "Enter Item name ",)),

                    // Category Text Label
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Textfieldlabel(label: "Category *",fontsize:  11.sp,),
                    ),
                    // Category Drop Down Menu button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child:
                          //  Drop down Button
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          isDense: true,
                          //menuMaxHeight: 300.h, // Maximum dropdown menu height
                          //itemHeight: 50.h, // Height of each dropdown item
                          validator: (value){
                            if(value==null){
                              return "Select Category !";
                            }
                            return null;
                          },
                          borderRadius: BorderRadius.circular(20.r),
                          dropdownColor: Theme.of(context).cardColor,
                          decoration: InputDecoration(
                            hint: Text('Select Category',style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),textAlign: TextAlign.start,),
                            filled: true,
                            fillColor: Theme.of(context).focusColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color(0xff00D100),
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color(0xff00D100),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.2
                              ),

                            ),
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 28.sp,
                          ),
                          // Category list showing code
                          items: categoryDetails.entries.map((item) {
                            return DropdownMenuItem(
                              value: item.value,
                              child: Row(
                                children: [
                                  Icon(
                                    item.value.icon,
                                    color: item.value.baseColor,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 14.w),
                                  Expanded(
                                    child: Text(
                                      item.value.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          // Function  after selecting the value
                          onChanged: (value) {
                            // _category = value!;
                          },
                        ),
                      ),
                    ),

                    //Quantity & unit Label
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Textfieldlabel(label: "Quantity & Unit *",fontsize:  11.sp,),
                    ),
                    //Quantity & unitForm Field
                    Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 5),
                        child: Textformfieldwidget(isObscure: false,hinttext: "       e.g. 2 pcs, 2 Kg",errormessage: "Enter Quantity of Item",)),

                    SizedBox(height: 15.h,),

                  ],
                )),

                SizedBox(height: 30.h,),

                // Second Container Notes
                Customebackgroundcontainer(childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Notes (Optional) Text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text("NOTES (OPTIONAL)",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:12.sp),),
                    ),
                    // Notes TextField
                    Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 10),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.normal,),
                          maxLines:4,
                          validator: (value){
                            return null;
                          },
                          onSaved: (value){},
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h,   // Decreasing this lowers the height
                            ),
                            hintText: "    e.g. Fresh ",
                            hintStyle: GoogleFonts.poppins(fontSize: 14.sp,wordSpacing:2.sp,color: Colors.grey,fontWeight: FontWeight.w500),
                            filled: true,
                            fillColor: Theme.of(context).focusColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.2
                              ),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Color(0xff00D100),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                    ),
                    SizedBox( height: 10.h,),
                  ],
                )),

                SizedBox(height: 25.h,),
                 // save Item Button
                Greenbutton(ButtonHeight: 50.h, ButtonWidth: 340.w, title: "Save Item", textsize: 18.sp, onTap: (){
                 if(_addNewItemformkey.currentState!.validate()){
                   ScaffoldMessenger.of(context).clearSnackBars();
                   ScaffoldMessenger.of(context).showSnackBar(
                     SuccessSnackBar.show("Item added successfully!"),
                   );
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboardscreen()));
                 }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}