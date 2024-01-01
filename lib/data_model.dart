class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel(
      {required this.limit,
      required this.quotes,
      required this.skip,
      required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> listQuotes = [];

    for(Map<String, dynamic> eachMap in json['quotes']){
      var eachQuote = QuoteModel.fromJson(eachMap);
      listQuotes.add(eachQuote);
    }


    return DataModel(
        limit: json['limit'],
        quotes: listQuotes,
        skip: json['skip'],
        total: json['total']);
  }
}

class QuoteModel {
  int id;
  String author;
  String quote;

  QuoteModel({required this.id, required this.author, required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'], author: json['author'], quote: json['quote']);
  }
}
