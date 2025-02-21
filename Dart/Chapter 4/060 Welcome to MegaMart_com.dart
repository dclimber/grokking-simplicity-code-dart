class Item {
  final String name;
  final double price;

  Item(this.name, this.price);
}

List<Item> shopping_cart = [];
double shopping_cart_total = 0;

void add_item_to_cart(String name, double price) {
  shopping_cart.add(Item(name, price));
  calc_cart_total();
}

void set_cart_total_dom() {} // dummy for compiling

void calc_cart_total() {
  shopping_cart_total = 0;
  for (var item in shopping_cart) {
    shopping_cart_total += item.price;
  }
  set_cart_total_dom();
}
