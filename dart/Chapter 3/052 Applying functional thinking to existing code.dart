class Affiliate {
  final double sales;
  final double comission;
  final String bank_code;

  Affiliate(this.sales, this.comission, this.bank_code);
}

void sendPayout(String bank_code, double owed) {}

void figurePayout(Affiliate affiliate) {
  var owed = affiliate.sales * affiliate.comission;
  if (owed > 100) // don’t send payouts less than $100
    sendPayout(affiliate.bank_code, owed);
}

void affiliatePayout(List<Affiliate> affiliates) {
  for (var affiliate in affiliates) {
    figurePayout(affiliate);
  }
}

void main() {
  List<Affiliate> affiliates = [];
  affiliatePayout(affiliates);
}
