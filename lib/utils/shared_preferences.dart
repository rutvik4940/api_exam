import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  static SharedHelper helper=SharedHelper._();
  SharedHelper._();
  List<String> a=[];
  List<String> b=[];
  List<String> c=[];
  Future<void> setData(List<String>category,description,price)
  async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setStringList("category", category);
    sharedPreferences.setStringList("description", description);
    sharedPreferences.setStringList("price", price);
  }
  Future<List<List<String>?>> getData()
  async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    if( sharedPreferences.getStringList("category")!=null)
    {
      a=( sharedPreferences.getStringList("category"))!;
      b= ( sharedPreferences.getStringList("description"))!;
      c=( sharedPreferences.getStringList("price"))!;
    }
    else
    {
      a=[];
      b=[];
      c=[];
    }
    List<List<String>?> list=[a,b,c];
    return  list;

  }
}