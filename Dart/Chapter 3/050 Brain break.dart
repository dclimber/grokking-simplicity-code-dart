import '045 Implementing the coupon email process.dart';

typedef FetchCouponsFromDB = List<Coupon> Function();
typedef FetchSubscribersFromDBPaged = List<Subscriber> Function(int page);

abstract class EmailSystem {
  void send(Message email);
}

void sendIssue(
  FetchCouponsFromDB fetchCouponsFromDB,
  FetchSubscribersFromDBPaged fetchSubscribersFromDB,
  EmailSystem emailSystem,
) {
  var coupons = fetchCouponsFromDB();
  var goodCoupons = selectCouponsByRank(coupons, "good");
  var bestCoupons = selectCouponsByRank(coupons, "best");
  int page = 0;
  var subscribers = fetchSubscribersFromDB(page);

  while (subscribers.length > 0) {
    var emails = emailsForSubscribers(subscribers, goodCoupons, bestCoupons);
    emails.forEach((email) => emailSystem.send(email));
    page++;
    subscribers = fetchSubscribersFromDB(page);
  }
}
