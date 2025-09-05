import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  int price1 = 120;
  int price2 = 80;
  int itemQuantity1 = 1;
  int itemQuantity2 = 1;
  int subtotal = 0;
  int total = 0;
  int shipping = 10;

  addQuantity1() {
    itemQuantity1 += 1;

    calculateSubtotal();
    notifyListeners();
  }

  addQuantity2() {
    itemQuantity2 += 1;

    calculateSubtotal();
    notifyListeners();
  }

  removeQuantity1() {
    if (itemQuantity1 > 0) {
      itemQuantity1 -= 1;

      calculateSubtotal();
      notifyListeners();
    }
  }

  removeQuantit2() {
    if (itemQuantity2 > 0) {
      itemQuantity2 -= 1;

      calculateSubtotal();
      notifyListeners();
    }
  }

  calculateSubtotal() {
    subtotal = (price1 * itemQuantity1) + (price2 * itemQuantity2);
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    total = subtotal + shipping;
    notifyListeners();
  }
}

// class CartController extends ChangeNotifier {
//   double itemPrice = 0.0;
//   // addPrice() {
//   //   itemPrice += 10;
//   //   notifyListeners();
//   // }

//   // makeDiscount() {
//   //   itemPrice -= 10;
//   //   notifyListeners();
//   // }
// }
/*
make a new controller named currencyController
in controller
make new value in controller named currency = USD
make a fun that change the currency 
in view 
make a text to view the currency (USD)
make a text field to chnage the currency
make an apply button 
when the n4button pressed the value in the text field will be replace the value in the text USD -> EGP
use both consumer and context.read/watch method
*/
