// Page 77 It's your turn
double shopping_cart_total = 0;

void set_tax_dom(double amount) {}

void update_tax_dom() {
  set_tax_dom(shopping_cart_total * 0.10);
}

// Page 78 Answer

/// Extracted

void update_tax_dom2() {
  set_tax_dom(calc_tax());
}

double calc_tax() {
  return shopping_cart_total * 0.10;
}

/// Done

void update_tax_dom3() {
  set_tax_dom(calc_tax2(shopping_cart_total));
}

double calc_tax2(double amount) {
  return amount * 0.10;
}
