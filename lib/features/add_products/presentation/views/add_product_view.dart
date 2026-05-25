import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/repos/images_repo/images_repo.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../manager/add_product/add_product_cubit.dart';
import '../manager/add_product/add_product_state.dart';
import '../widgets/add_product_view_body.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product';

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add_product_title".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocProvider(
          create: (context) => AddProductCubit(
            GetIt.I<ImagesRepo>(),
            GetIt.I<ProductsRepo>(),
          ),
          child: BlocConsumer<AddProductCubit, AddProductStates>(
            listener: (context, state) {
              if (state is AddProductSuccess) {
               // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("add_product_success".tr()),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is AddProductFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AddProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const AddProductViewBody();
            },
          ),
        ),
      ),
    );
  }
}