import "060 Welcome to MegaMart_com.dart";
// import is for linter and compiler to not complain

// Page 68

/// Original
void update_tax_dom() {
  set_tax_dom(shopping_cart_total * 0.10);
}

void calc_cart_total() {
  shopping_cart_total = 0;
  for (var i = 0; i < shopping_cart.length; i++) {
    var item = shopping_cart[i];
    shopping_cart_total += item.price;
  }
  set_cart_total_dom();
  update_shipping_icons();
  update_tax_dom();
}

void set_tax_dom(double amount) {}
void update_shipping_icons() {}

/// Extracted

void calc_cart_total1() {
  calc_total1();
  set_cart_total_dom();
  update_shipping_icons();
  update_tax_dom();
}

void calc_total1() {
  shopping_cart_total = 0;
  for (var i = 0; i < shopping_cart.length; i++) {
    var item = shopping_cart[i];
    shopping_cart_total += item.price;
  }
}

// Page 69

/// Eliminated outputs

void calc_cart_total2() {
  shopping_cart_total = calc_total2();
  set_cart_total_dom();
  update_shipping_icons();
  update_tax_dom();
}

double calc_total2() {
  double total = 0;
  for (var i = 0; i < shopping_cart.length; i++) {
    var item = shopping_cart[i];
    total += item.price;
  }
  return total;
}

// Page 70

/// Eliminated inputs

void calc_cart_total3() {
  shopping_cart_total = calc_total3(shopping_cart);
  set_cart_total_dom();
  update_shipping_icons();
  update_tax_dom();
}

double calc_total3(cart) {
  double total = 0;
  for (var i = 0; i < cart.length; i++) {
    var item = cart[i];
    total += item.price;
  }
  return total;
}
