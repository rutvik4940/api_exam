import 'package:api_exam/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    // Ensure that provider is accessed correctly in initState
    {
      context.read<HomeProvider>().getData();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Shopping",style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "cart");
            },
            icon: Icon(Icons.shopping_cart),

          ),
        ],
        // backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                ActionChip(
                  label: Text("ALL"),
                  onPressed: () {
                    providerW!.getData();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ActionChip(
                  label: Text("A TO Z"),
                  onPressed: () {
                    providerW!.sortListAtoZ(0);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ActionChip(
                  label: Text("Z TO A"),
                  onPressed: () {
                    providerW!.sortListZtoA(1);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ActionChip(
                  label: Text("HIGH"),
                  onPressed: () {
                    providerW!.sortListHightoLow(2);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                ActionChip(
                  label: Text("LOW"),
                  onPressed: () {
                    providerW!.sortListLowtoHigh(3);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: providerW!.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ProductModel p1 = providerW!.list[index];
                    Navigator.pushNamed(context, 'product', arguments: p1);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            "${providerW!.list[index].image}",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          // visible: ,
                          child: Text(
                            "${providerW!.list[index].category}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("₹ ${providerW!.list[index].price}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${providerW!.list[index].ratingModel!.rate}"),
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
