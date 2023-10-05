import 'package:flutter/material.dart';
import '/model/product.dart';

List<Product> fishList = [
  Product(name: "Sardine", price: 120, image: "assets/images/saradine.jpg"),
  Product(name: "Rohu", price: 100, image: "assets/images/rohu.jpg"),
  Product(name: "Tuna", price: 500, image: "assets/images/tuna.jpg"),
  Product(name: "Prawns", price: 800, image: "assets/images/prawns.jpg"),
  Product(name: "Mackerel", price: 150, image: "assets/images/mackerel.jpg"),
  Product(name: "King Fish", price: 210, image: "assets/images/king_fish.jpg"),
  Product(name: "Red Snapper", price: 200, image: "assets/images/red-snapper.jpg"),
];
List<Product> marinatedList = [
  Product(name: "Chicken Tikka", price: 250, image: "assets/images/chicken_tikka.jpg"),
  Product(name: "Fish Tikka", price: 200, image: "assets/images/fish_tikka.jpeg"),
  Product(name: "Mutton Kebab", price: 400, image: "assets/images/mutton_kebab.jpg"),
  Product(name: "Chicken Malai Tikka", price: 300, image: "assets/images/chicken_tikka.jpg"),
];

List<Product> meatList = [
  Product(name: "Chicken", price: 250, image: "assets/images/chicken.jpg"),
  Product(name: "Beef", price: 350, image: "assets/images/beef.jpg"),
  Product(name: "Mutton", price: 500, image: "assets/images/mutton.jpg"),
  Product(name: "Duck", price: 300, image: "assets/images/duck.jpeg"),
];

List<Product> readytocookList = [
  Product(name: "Chicken Samosa", price: 100, image: "assets/images/chicken_samosa.jpg"),
  Product(name: "Chicken Cutlet", price: 120, image: "assets/images/chicken_cutlet.jpg"),
  Product(name: "Chicken Spring Role", price: 120, image: "assets/images/chicken-spring-roll.jpg"),
  Product(name: "Fish Cutlet", price: 100, image: "assets/images/fish_cutlet.jpg"),
  Product(name: "Mutton Cutlet", price: 150, image: "assets/images/mutton_cutlets.jpg"),
];


class ProductProvider extends ChangeNotifier {
  int? tprice=0;
  final List<Product> _fish = fishList;

  List<Product> get fish => _fish; //getter to access list of fish in home page

  final List<Product> _meat = meatList;

  List<Product> get meat => _meat; //getter to access list of meat in home page

  final List<Product> _marinated = marinatedList;

  List<Product> get marinated =>
      _marinated; //getter to access list of marinated in home page

  final List<Product> _readytocook = readytocookList;

  List<Product> get readytocook =>
      _readytocook; //getter to access list of readytocook in home page

  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  int total = 0;

  void addToList(Product productfromMain) {
    int index = _cart.indexWhere((element) => element == productfromMain);
    if (index != -1) {
      _cart[index].count = _cart[index].count + 1;
      notifyListeners();

    } else {
      _cart.add(productfromMain);
      notifyListeners();
    }
  }

  void removeFromList(Product removeproduct) {
    //  int index = _cart.indexWhere((element) => element == removeproduct);
    if ( removeproduct.count>1) {
      removeproduct.count = removeproduct.count - 1;
      notifyListeners();
    } else {
      _cart.remove(removeproduct);
      notifyListeners();
    }
  }
}
/*
void addToList(Product productfromMain){
    _cart.forEach((element){
      if(element==productfromMain){
        element.count=element.count+1;
      }
      else{
    _cart.add(productfromMain);
    //total=total+element.price*count;
    notifyListeners();
  }});}

 */