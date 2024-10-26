import 'package:ambulance/core/app_styles.dart';
import 'package:flutter/material.dart';
import '../widgets/all_orders/custom_all_orders_body.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('طلبات الاسعاف السابقة', style: AppStyles.textstyle05.copyWith(fontWeight: FontWeight.bold),),
        ),
        body: const CustomAllOrdersBody(),
      ),
    );
  }
}
