import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/add_product_view_body.dart';
class AddProductView extends StatefulWidget {
  const AddProductView({super.key});
 static const routeName ='add_product';

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("add_product_title".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AddProductViewBody(),
      ),
    );
  }
}
