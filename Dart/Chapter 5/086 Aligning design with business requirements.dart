bool gets_free_shipping(num total, num item_price) {
  return item_price + total >= 20;
}

num calc_total(List<Item> cart) {
  num total = 0;
  for (var i = 0; i < cart.length; i++) {
    var item = cart[i];
    total += item.price;
  }
  return total;
}

class Item {
  final String name;
  final double price;

  Item(this.name, this.price);
}
