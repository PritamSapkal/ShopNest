import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/widgets/CustomeBackgroundContainer.dart';
import 'package:shopnest/widgets/GreenButton.dart';
import '../DataModel/CategoryUiProps.dart';
import '../DataModel/ItemModel.dart';
import '../Provider/MasterItemList.dart';
import '../data/ItemCategory.dart';
import '../widgets/SuccessSnackBar.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';

class AddNewItemScreen extends ConsumerStatefulWidget {
  const AddNewItemScreen({
    required this.appbarTitle,
    super.key,
    this.existingItem,
  });

  final String appbarTitle;
  final Itemmodel? existingItem; // null = Add Mode, non-null = Edit Mode

  @override
  ConsumerState<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends ConsumerState<AddNewItemScreen> {
  final _addNewItemformkey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _quantityController;
  late final TextEditingController _notesController;
  ItemCategory? _selectedCategory;

  bool get isEditMode => widget.existingItem != null;

  @override
  void initState() {
    super.initState();
    // Pre-populate fields if editing, otherwise empty
    _nameController = TextEditingController(text: widget.existingItem?.name ?? '');
    _quantityController = TextEditingController(text: widget.existingItem?.quantity?.toString() ?? '');
    _notesController = TextEditingController(text: widget.existingItem?.notes ?? '');

    // Match the category from existingItem with the instances in categoryDetails
    if (widget.existingItem != null) {
      _selectedCategory = widget.existingItem!.category;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveItem() {
    if (!_addNewItemformkey.currentState!.validate()) return;

    if (isEditMode) {
      // 1. UPDATE EXISTING ITEM
      final updatedItem = widget.existingItem!.copyWith(
        name: _nameController.text.trim(),
        category: _selectedCategory!,
        quantity: _quantityController.text.trim(),
        notes: _notesController.text.trim(),
      );

      ref.read(masteritemlistProvider.notifier).updateItem(updatedItem);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SuccessSnackBar.show("Item updated successfully!"),
      );
    } else {
      // 2. ADD NEW ITEM
      final newItem = Itemmodel(
        name: _nameController.text.trim(),
        category: _selectedCategory!,
        quantity: _quantityController.text.trim(),
        notes: _notesController.text.trim(),
        status: false,
        addedTime: DateTime.now(),
      );

      ref.read(masteritemlistProvider.notifier).addItem(newItem);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SuccessSnackBar.show("Item added successfully!"),
      );
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          widget.appbarTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: _addNewItemformkey,
            child: Column(
              children: [
                // Details Container
                Customebackgroundcontainer(
                  childwidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "ITEM DETAILS",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Textfieldlabel(label: "Item Name *", fontsize: 11.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Textformfieldwidget(
                          controller: _nameController,
                          isObscure: false,
                          hinttext: "       e.g. Organic Spinach",
                          errormessage: "Enter Item name",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Textfieldlabel(label: "Category *", fontsize: 11.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: DropdownButtonFormField<ItemCategory>(
                            value: _selectedCategory,
                            isExpanded: true,
                            isDense: true,

                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            },

                            validator: (value) {
                              if (value == null) {
                                return "Select Category !";
                              }
                              return null;
                            },

                            borderRadius: BorderRadius.circular(20.r),
                            dropdownColor: Theme.of(context).cardColor,

                            decoration: InputDecoration(
                              hint: Text(
                                '  Select Category',
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                                borderSide: const BorderSide(
                                  color: Color(0xff00D100),
                                  width: 1,
                                ),
                              ),

                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.2,
                                ),
                              ),
                            ),

                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 28.sp,
                            ),

                            items: categoryDetails.entries.skip(1).map((item) {
                              final category = item.key;
                              final uiProps = item.value;

                              return DropdownMenuItem<ItemCategory>(
                                value: category,
                                child: Row(
                                  children: [
                                    Icon(
                                      uiProps.icon,
                                      color: uiProps.baseColor,
                                      size: 20.sp,
                                    ),

                                    SizedBox(width: 14.w),

                                    Expanded(
                                      child: Text(
                                        uiProps.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(fontSize: 13.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Textfieldlabel(label: "Quantity & Unit *", fontsize: 11.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Textformfieldwidget(
                          controller: _quantityController,
                          isObscure: false,
                          hinttext: "       e.g. 2 pcs, 2 Kg",
                          errormessage: "Enter Quantity of Item",
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                // Notes Container
                Customebackgroundcontainer(
                  childwidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "NOTES (OPTIONAL)",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 4,
                          controller: _notesController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                            hintText: "    e.g. Fresh ",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              wordSpacing: 2.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).focusColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.grey, width: 0.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Color(0xff00D100), width: 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                // Save / Update Button
                Greenbutton(
                  ButtonHeight: 50.h,
                  ButtonWidth: 340.w,
                  title: isEditMode ? "Update Item" : "Save Item",
                  textsize: 18.sp,
                  onTap: _saveItem,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}