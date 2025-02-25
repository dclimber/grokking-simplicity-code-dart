import "086 Aligning design with business requirements.dart";

// Original
bool gets_free_shipping(num total, num item_price) {
  return item_price + total >= 20;
}

// With new signature
bool gets_free_shipping_new(List<Item> cart) {
  return calc_total(cart) >= 20;
}

// Original
List<Item> shopping_cart = [];
num shopping_cart_total = 0;

class Button {
  Item item;

  Button(this.item);

  void show_free_shipping_icon() {}

  void hide_free_shipping_icon() {}
}

List<Item> add_item3(List<Item> cart, String name, double price) {
  List<Item> new_cart = List.from(cart);
  new_cart.add(Item(name, price));
  return new_cart;
}

List<Button> get_buy_buttons_dom() => [];
void update_shipping_icons() {
  var buy_buttons = get_buy_buttons_dom();
  for (var i = 0; i < buy_buttons.length; i++) {
    var button = buy_buttons[i];
    var item = button.item;
    if (item.price + shopping_cart_total >= 20)
      button.show_free_shipping_icon();
    else
      button.hide_free_shipping_icon();
  }
}

// With new signature
void update_shipping_icons_new() {
  List<Button> buttons = get_buy_buttons_dom();
  for (var i = 0; i < buttons.length; i++) {
    var button = buttons[i];
    var item = button.item;
    var new_cart = add_item3(shopping_cart, item.name, item.price);
    if (gets_free_shipping_new(new_cart))
      button.show_free_shipping_icon();
    else
      button.hide_free_shipping_icon();
  }
}
