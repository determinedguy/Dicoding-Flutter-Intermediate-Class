class Review {
  Review({
    required this.id,
    required this.name,
    required this.review,
    required this.date,
  });

  String? id;
  String name;
  String review;
  String date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        name: json["name"],
        review: json["review"],
        date: json["date"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "review": review,
        "date": date,
      };
}

class ResponseReview {
  bool error;
  String message;
  List<Review> customerReviews;

  ResponseReview({required this.error, required this.message, required this.customerReviews});

  factory ResponseReview.fromJson(Map<String, dynamic> json) => ResponseReview(
        error: json["error"],
        message: json["message"],
        customerReviews: List<Review>.from(json["customerReviews"].map((x) => Review.fromJson(x))),
      );
}
