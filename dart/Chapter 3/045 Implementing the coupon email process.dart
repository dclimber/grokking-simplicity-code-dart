class Subscriber {
  final String email;
  final int rec_count;

  Subscriber(this.email, this.rec_count);
}

var subscriber = Subscriber("sam@pmail.com", 16);
var rank1 = "best";
var rank2 = "good";

String subCouponRank(Subscriber subscriber) {
  if (subscriber.rec_count >= 10) {
    return "best";
  } else {
    return "good";
  }
}

class Coupon {
  final String code;
  final String rank;

  Coupon(this.code, this.rank);
}

var coupon = Coupon("10PERCENT", "bad");

List<String> selectCouponsByRank(List<Coupon> coupons, String rank) {
  List<String> ret = [];
  for (var coupon in coupons) {
    if (coupon.rank == rank) {
      ret.add(coupon.code);
    }
  }
  return ret;
}

class Message {
  final String from;
  final String to;
  final String subject;
  final String body;

  Message(this.from, this.to, this.subject, this.body);
}

var message = Message(
  "newsletter@coupondog.co",
  "sam@pmail.com",
  "Your weekly coupons inside",
  "Here are your coupons ...",
);

Message emailForSubscriber(
  Subscriber subscriber,
  List<String> goods,
  List<String> bests,
) {
  var rank = subCouponRank(subscriber);
  if (rank == "best") {
    return Message(
      "newsletter@coupondog.co",
      subscriber.email,
      "Your best weekly coupons inside",
      "Here are the best coupons: " + bests.join(", "),
    );
  } else {
    // rank == "good"
    return Message(
      "newsletter@coupondog.co",
      subscriber.email,
      "Your good weekly coupons inside",
      "Here are the good coupons: " + goods.join(", "),
    );
  }
}

List<Message> emailsForSubscribers(
  List<Subscriber> subscribers,
  List<String> goods,
  List<String> bests,
) {
  List<Message> emails = [];

  for (var subscriber in subscribers) {
    var email = emailForSubscriber(subscriber, goods, bests);
    emails.add(email);
  }
  return emails;
}

typedef FetchCouponsFromDB = List<Coupon> Function();
typedef FetchSubscribersFromDB = List<Subscriber> Function();

abstract class EmailSystem {
  void send(Message email);
}

void sendIssue(
  FetchCouponsFromDB fetchCouponsFromDB,
  FetchSubscribersFromDB fetchSubscribersFromDB,
  EmailSystem emailSystem,
) {
  var coupons = fetchCouponsFromDB();
  var goodCoupons = selectCouponsByRank(coupons, "good");
  var bestCoupons = selectCouponsByRank(coupons, "best");
  var subscribers = fetchSubscribersFromDB();
  var emails = emailsForSubscribers(subscribers, goodCoupons, bestCoupons);
  emails.forEach((email) => emailSystem.send(email));
}

// -- demo --
class PrintBasedEmailSystem implements EmailSystem {
  void send(Message email) {
    print(
      "----\nSent an Email:\nto:'${email.to}'\nfrom:'${email.from}'\n"
      "subject:'${email.subject}'\nbody:'${email.body}'\n----",
    );
  }
}

void main() {
  List<Coupon> mockCouponFetcher() => [
    Coupon("kawabunga", rank1),
    Coupon("summer2025", rank2),
  ];
  List<Subscriber> mockSubscriberFetcher() => [
    Subscriber("mr@smith.com", 10),
    Subscriber("mrs@smith.com", 20),
  ];

  sendIssue(mockCouponFetcher, mockSubscriberFetcher, PrintBasedEmailSystem());
}
