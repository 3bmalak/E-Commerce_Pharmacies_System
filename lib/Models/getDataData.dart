class GetDataModel {
  dynamic id;
  dynamic image;
  dynamic cost;
  dynamic name;
  dynamic categories;
  bool inFavorite=false;
  dynamic count=0;

    GetDataModel.fromJson(Map<String, dynamic> json)
    {
      id= json['id'];
      image= json['image'];
      name= json['name'];
      categories= json['categories'];
      cost= json['cost'];
  }
  Map<String, dynamic> toMap()
  {
    return {
      'id':id,
      'name' : name,
      'image' : image,
      'categories' : categories,
      'cost' : cost,
    };
  }
}