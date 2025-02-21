import '060 Welcome to MegaMart_com.dart';
// import is for linter and compiler to not complain

class Button {
  Item item;

  Button(this.item);

  void show_free_shipping_icon() {}

  void hide_free_shipping_icon() {}
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

void calc_cart_total() {
  shopping_cart_total = 0;
  for (var i = 0; i < shopping_cart.length; i++) {
    var item = shopping_cart[i];
    shopping_cart_total += item.price;
  }
  set_cart_total_dom();
  update_shipping_icons();
}
