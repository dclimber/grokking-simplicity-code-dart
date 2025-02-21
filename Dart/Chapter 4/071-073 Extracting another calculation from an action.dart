import '060 Welcome to MegaMart_com.dart';
// import is for linter and compiler to not complain

// Page 71

/// Original

void add_item_to_cart(String name, double price) {
  shopping_cart.add(Item(name, price));
  calc_cart_total();
}

/// Extracted

void add_item_to_cart1(String name, double price) {
  add_item1(name, price);
  calc_cart_total();
}

void add_item1(String name, double price) {
  shopping_cart.add(Item(name, price));
}

// Page 72

/// Eliminated input

void add_item_to_cart2(String name, double price) {
  add_item2(shopping_cart, name, price);
  calc_cart_total();
}

void add_item2(List<Item> cart, String name, double price) {
  cart.add(Item(name, price));
}

// Page 73

/// Eliminated output

void add_item_to_cart3(String name, double price) {
  shopping_cart = add_item3(shopping_cart, name, price);
  calc_cart_total();
}

List<Item> add_item3(List<Item> cart, String name, double price) {
  List<Item> new_cart = List.from(cart);
  new_cart.add(Item(name, price));
  return new_cart;
}
