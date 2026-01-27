import 'package:flutter/material.dart';
import 'package:dress_shop_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  //* list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "Air Jordans",
      price: "220",
      description:
          "У вас есть прыжки и скорость - зашнуруйте обувь, которая усилит то, что вы приносите на площадку",
      imagePath: "assets/images/jordan.png",
    ),
    Shoe(
      name: "KD Treys",
      price: "240",
      description:
          "Надежный ремешок на средней части стопы идеально подходит для забивания голов и защитных стоек, чтобы вы могли зафиксироваться и продолжать побеждать.",
      imagePath: "assets/images/kdtrey.png",
    ),
    Shoe(
      name: "Zoom FREAK",
      price: "236",
      description: "Инновационный дизайн его последней фирменной обуви.",
      imagePath: "assets/images/zoomfreak.png",
    ),
    Shoe(
      name: "Zion 2",
      price: "120",
      description:
          "Достигните новых уровней скорости и силы в обуви, разработанной для Зиона и созданной для баскетболистов любого уровня.",
      imagePath: "assets/images/zion2.png",
    ),
  ];

  //* list of items in user card
  List<Shoe> userCart = [];
  //* get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //* get card
  List<Shoe> getUserCart() {
    return userCart;
  }

  //* add items to card
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //* remove item from card
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
