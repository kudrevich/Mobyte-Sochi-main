import 'package:flutter/material.dart';
import 'package:football_screens/helpers/requests.dart';

class Item {
  String id;
  final String name;
  final String subName;
  final String price;
  final String caption1;
  final String caption2;
  final String caption3;
  int position;
  String picUrl;
  int categoryId;
  NetworkImage image;

  Item(
      {@required this.name,
      @required this.image,
      this.subName = '',
      this.caption1 = '',
      this.caption2 = '',
      this.caption3 = '',
      @required this.price,
      @required this.id,
      @required this.position,
      this.categoryId = 1,
      this.picUrl});
  void printAll() {
    print("id = $id");
    print("name = $name");
    print("subName = $subName");
    print("caption1 = $caption1");
    print("caption2 = $caption2");
    print("caption3 = $caption3");
  }

  Item.fromData(Map<String, dynamic> data)
      : id = (data['id']).toString(),
        name = data['name'] ?? ' ',
        subName = data['subname'] ?? ' ',
        caption1 = data['caption1'] ?? ' ',
        caption2 = data['caption2'] ?? ' ',
        caption3 = data['caption3'] ?? ' ',
        price = data['price'] ?? ' ',
        categoryId = data['category_id'] ?? 1,
        position = data['zindex'],
        picUrl = data['picture']['url'] ??
            'http://${Requests.IP}/uploads/picurl.jpeg',
        image = ((data['picture']['url'] != null)
            ? NetworkImage(Requests.URL + data['picture']['url'])
            : NetworkImage('http://${Requests.IP}/uploads/picurl.jpeg'));

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subname': subName,
      'caption1': caption1,
      'caption2': caption2,
      'caption3': caption3,
      'price': price,
      'category': categoryId,
      'picture':
          (picUrl.length > 100) ? "data:image/jpeg;base64," + picUrl : picUrl,
      'zindex': position,
    };
  }

  Future<bool> evictImage() async {
    return await image.evict();
  }
}
