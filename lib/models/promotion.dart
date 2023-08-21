class Promotion{
  final int? id;
  final String? discountCodeDTO;
  final num? totalPurchaseDTO;
  final int? discountDTO;
  final num? maxGetDTO;
  final String? expireDateDTO;
  final bool? campagnDTO;
  final bool? statusDTO;

  Promotion({
      this.id,
      this.discountCodeDTO,
      this.totalPurchaseDTO,
      this.discountDTO,
      this.maxGetDTO,
      this.expireDateDTO,
      this.campagnDTO,
      this.statusDTO});

  factory Promotion.fromJson(Map<String, dynamic> json){
    return Promotion(
        id : json['id'],
        discountCodeDTO :json['discountCodeDTO'],
        totalPurchaseDTO :json['totalPurchaseDTO'],
        discountDTO :json['discountDTO'],
        maxGetDTO :json['maxGetDTO'],
        expireDateDTO :json['expireDateDTO'],
        campagnDTO :json['campagnDTO'],
        statusDTO :json['statusDTO']
    );
  }
}