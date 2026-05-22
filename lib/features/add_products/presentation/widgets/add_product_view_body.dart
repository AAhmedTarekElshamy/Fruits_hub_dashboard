import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/image_field.dart';
import '../../../../core/widgets/terms_for_dash.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  bool isCheck = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(children: [
         CustomTextField(hintText: "product_name".tr(), textInputType:  TextInputType.text,),
          const SizedBox(height: 20,),
          CustomTextField(hintText: "product_code".tr(), textInputType:  TextInputType.text),
          const SizedBox(height: 20,),
          CustomTextField(hintText: "product_price".tr(), textInputType:  TextInputType.text),
          const SizedBox(height: 20,),

          CustomTextField(hintText: "product_description".tr(), textInputType:  TextInputType.text,maxLines: 5),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: TermsForDash(

                onChanged: (bool value) {
                  setState(() => isCheck = value);
                }),
          ),
          const SizedBox(height: 20,),
          ImageField(onFilePicked: (File? value) {  },),

        ]),
      ),
    );
  }
}
