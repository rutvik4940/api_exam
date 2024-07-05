import 'package:api_exam/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/shared_preferences.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{
  List<ProductModel>list=[];
  int? changIndex;
  List<String>? h=[];
  List<String>? r=[];
  List<String>? s=[];
  List<List<String>?> list1=[];

  Future<void> getData()
  async {
   List<ProductModel>?l1 =await ApiHelper.helper.getProduct();
   if(l1!=null)
     {
       list=l1;
       notifyListeners();
     }
  }
  void sortListAtoZ(int index) {
    list.sort((a, b) => a.title!.compareTo(b.title!));
    changIndex= index;
    notifyListeners();
  }

  void sortListZtoA(int index) {
    list.sort((a, b) => b.title!.compareTo(a.title!));
   changIndex = index;
    notifyListeners();
  }

  void sortListLowtoHigh(int index) {
    list.sort((a, b) => b.price!.compareTo(a.price!));
    changIndex = index;
    notifyListeners();
  }

  void sortListHightoLow(int index) {
    list.sort((a, b) => a.price!.compareTo(b.price!));
   changIndex = index;
    notifyListeners();
  }
  void categoryWise(int index)
  {
    list.sort((a, b) => b.category!.compareTo(a.category!));
    changIndex = index;
    notifyListeners();
  }

  Future<void> setProductData(
      {required String category,
        required String description,
        required String price}) async {
    getProductData();
    h!.add(category);
    r!.add(description);
    s!.add(price);
    await SharedHelper.helper.setData(h!, r!, s!);
    getProductData();
  }

  Future<void> getProductData() async {
    list1 = await SharedHelper.helper.getData();
    h = list1[0]!;
    r = list1[1]!;
    s = list1[2]!;
  }

  Future<void> delet(int index) async {
    getProductData();
    h!.removeAt(index);
    s!.removeAt(index);
    r!.removeAt(index);
    await SharedHelper.helper.setData(h!, r!, s!);
    getProductData();
  }

}