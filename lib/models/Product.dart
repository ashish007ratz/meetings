class Product{
  int id;
  String title;
  String about;
  String actorName;
  String duration;
  int star;
  int likes;
  int save;
  int fee;
  String imageUrl;
  Product(this.id, this.title,this.about, this.actorName,this.duration,this.star,this.likes,this.save,this.fee, this.imageUrl);


  static List<Product> getList(int count){
    return products.getRange(0, count ).toList();
  }
  static Product getById(int id){
    return products.firstWhere((p) => p.id == id);
  }
}

List<Product> products =
  List.generate(imgList.length, (index) => Product(index, "This is product ${index}", aboutUS, "Ashish Raturi", "20 minutes", 4, 1260, 500, 1000,imgList[index]));

String aboutUS = "Every business has an origin story worth telling, and usually, one that justifies why you even do business and have clients.\nSome centennial enterprises have pages of content that can fit in this section, while startups can tell the story of how the company was born, its challenges, and its vision for the future.";
final List<String> imgList = [
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];