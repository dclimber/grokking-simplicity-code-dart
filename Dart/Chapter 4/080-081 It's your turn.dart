import '060 Welcome to MegaMart_com.dart';
// import is for linter and compiler to not complain

// Page 80 It's your turn
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

// Page 81 Answer

/// Extracted

void update_shipping_icons_ans() {
  var buy_buttons = get_buy_buttons_dom();
  for (var i = 0; i < buy_buttons.length; i++) {
    var button = buy_buttons[i];
    var item = button.item;
    if (gets_free_shipping(item.price, shopping_cart_total))
      button.show_free_shipping_icon();
    else
      button.hide_free_shipping_icon();
  }
}

bool gets_free_shipping(double price, double cart_total) {
  return (price + cart_total) >= 20;
}
