class CryptoModel {
  final String name;
  final String symbol;
  final double priceUsd;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.priceUsd,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      name: json['name'],
      symbol: json['symbol'],
      priceUsd: double.tryParse(json['priceUsd'] ?? '') ?? 0,
    );
  }
}
