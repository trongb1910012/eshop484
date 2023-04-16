import 'package:flutter/material.dart';
import '../../models/shop.dart';

class DetailShop extends StatelessWidget {
  static const routeName = '/shop-detail';
  const DetailShop(
    this.shop, {
    super.key,
  });
  final Shop shop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(shop.name),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 30, 20),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 51, 177, 78)
                                    .withOpacity(0.7)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(shop.imageUrl),
                                fit: BoxFit.cover,
                              )
                            ],
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            shop.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            shop.description,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Giá: ${shop.price}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 170, 15, 54)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ))),
        ));
  }
}
