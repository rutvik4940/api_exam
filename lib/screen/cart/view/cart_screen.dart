// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../home/provider/home_provider.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   HomeProvider? providerR;
//   HomeProvider? providerW;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<HomeProvider>().getProductData();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     providerR = context.read<HomeProvider>();
//     providerW = context.watch<HomeProvider>();
//     return   Scaffold(
//       appBar: AppBar(
//         title: Text("cart"),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(itemCount: providerW!.h!.length,itemBuilder: (context, index) {
//           //   return Text("${providerW!.h![index].}");
//           // },)
//         ],
//       ),
//     );
//   }
// }
