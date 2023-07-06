class FeedbackModel {
  late String rate;
  late String comment;
  late String type;
  late String userName;

  FeedbackModel(
      {required this.rate,
      required this.comment,
      required this.type,
      required this.userName});
  FeedbackModel.fromJson(Map<String, dynamic>? json) {
    rate = json!['rate'];
    comment = json['comment'];
    type = json['type'];
    userName = json['userName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'comment': comment,
      'type': type,
      'userName': userName,
    };
  }
}
