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
import 'is_organic_check.dart';

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
  late int expirationMonths,
      numOfCalories,
      unitAmount; // ← Added missing fields
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
              onSaved: (value) => name = value!,
              hintText: "product_name".tr(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) => code = value!.toLowerCase(),
              hintText: "product_code".tr(),
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) =>
                  expirationMonths = int.parse(value!), // ← int not num
              hintText: "Expiration Months",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) => price = double.parse(value!),
              hintText: "product_price".tr(),
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) => numOfCalories = int.parse(value!), // ← Added
              hintText: "Calories",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) => unitAmount = int.parse(value!), // ← Added
              hintText: "Unit Amount",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onSaved: (value) => description = value!,
              hintText: "product_description".tr(),
              textInputType: TextInputType.text,
              maxLines: 3,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: TermsForDash(
                onChanged: (bool value) {
                  setState(() => isFeatured = value);
                },
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: IsOrganicCheck(
                onChanged: (bool value) {
                  setState(() => isCheck = value);
                },
              ),
            ),
            const SizedBox(height: 15),
            ImageField(
              onFilePicked: (File? value) {
                setState(() => image = value);
              },
            ),
            const SizedBox(height: 20),

            CustomButton(
              label: "add_product_title".tr(),
              onPressed: () {
                if (image != null) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    AddProductEntity input = AddProductEntity(
                      name: name,
                      code: code,
                      price: price,
                      description: description,
                      isFeatured: isFeatured,
                      image: image!,
                      expirationMonths: expirationMonths,
                      numOfCalories: numOfCalories,
                      unitAmount: unitAmount,
                    );
                    context.read<AddProductCubit>().addProduct(input);
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select an image')),
                  );
                }
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
