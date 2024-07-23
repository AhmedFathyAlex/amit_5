class ItemModel{
  static int id = 0;
  String name;
  int price;
  late int itemId;

  ItemModel({required this.name, required this.price}){
    itemId = ++id;
  }

}