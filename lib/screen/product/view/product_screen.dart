import 'package:api_exam/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    ProductModel m1 =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
       centerTitle: true,
        title: const Text("Products",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)]),
              child: Image.network(
                "${m1.image}",
                fit: BoxFit.cover,
                height: 300,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${m1.category}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "\$ ${m1.price}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "${m1.description}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
                onPressed: () {
                  providerW!.setProductData(category:m1.category!, description: m1.description!, price: m1.price.toString());
                  Navigator.pop(context);
                },
                child: const Text("Add to cart",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
