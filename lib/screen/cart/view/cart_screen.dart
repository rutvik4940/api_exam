import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;


  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("cart",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.r!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerW!.delete(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10 ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan,
                    ),
                    child: Column(
                      children: [
                        Text("${providerW!.r![index]}",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("${providerW!.h![index]}"),
                        SizedBox(height: 10,),
                        Text("${providerW!.s![index]}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
