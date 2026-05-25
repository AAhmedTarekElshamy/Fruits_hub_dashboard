import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/image_field.dart';
import '../../../../core/widgets/terms_for_dash.dart';
import '../../domain/entities/add_product_input_entity.dart';
import '../manager/add_product/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  bool isCheck = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String name, code, description;
  late num price;
  File? image;
  bool isFeatured = false;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            CustomTextField(
              onSaved: (value) {
                name = value!;
              },
              hintText: "product_name".tr(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              onSaved: (value) {
                code = value!.toLowerCase();
              },
              hintText: "product_code".tr(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              onSaved: (value) {
                price = double.parse(value!);
              },
              hintText: "product_price".tr(),
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              onSaved: (value) {
                description = value!;
              },
              hintText: "product_description".tr(),
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TermsForDash(
                onChanged: (bool value) {
                  setState(() => isFeatured = value);
                },
              ),
            ),
            const SizedBox(height: 20),
            ImageField(
              onFilePicked: (File? value) {
                image = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "add_product_title".tr(),
              onPressed: () {
                if(image!=null){
                if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                // how to save product in fire base collection called product
                AddProductEntity input= AddProductEntity(name: name, code:code, price: price, description: description, isFeatured: isFeatured, image: image!, imageUrl: null);
                context.read<AddProductCubit>().addProduct(input);
                }else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an image'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
