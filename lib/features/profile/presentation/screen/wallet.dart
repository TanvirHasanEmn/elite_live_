import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/wallet_controller.dart';
import '../widget/transaction_widgets.dart';
import '../widget/wallet_widgets.dart';

class WalletPage extends StatelessWidget {
  final WalletController controller = Get.put(WalletController());

  WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WalletHeaderCard(controller: controller),
            SizedBox(height: 24.h),
            Text(
              'Transaction History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Obx(() => Column(
              children: controller.transactions
                  .map((tx) => TransactionItem(
                title: tx['title'],
                date: tx['date'],
                amount: tx['amount'],
              ))
                  .toList(),
            )),
          ],
        ),
      ),
    );
  }
}
