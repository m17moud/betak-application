class ProductEntity {
  String id;
  String pname;
  String pdescribtion;
  int pPrice;
  int departmentid;
  String sellerid;
  List<dynamic> images;
  Seller seller;
  List<dynamic> shops;
  int likes;

  ProductEntity({
    required this.id,
    required this.pname,
    required this.pdescribtion,
    required this.pPrice,
    required this.departmentid,
    required this.sellerid,
    required this.images,
    required this.seller,
    required this.shops,
    required this.likes,
  });

}

class Seller {
  String sname;
  String semail;
  String saddress;
  String smobile;
  String facebookUrl;

  Seller({
    required this.sname,
    required this.semail,
    required this.saddress,
    required this.smobile,
    required this.facebookUrl,
  });

}
