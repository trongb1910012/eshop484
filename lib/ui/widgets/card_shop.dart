import 'package:flutter/material.dart';
import '../../screens.dart';
import '../../models/shop.dart';
import 'package:provider/provider.dart';
import '../manager/cart_manager.dart';

class CardShop extends StatelessWidget {
  const CardShop(
    this.shop, {
    super.key,
  });
  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailShop.routeName,
              arguments: shop.id,
            );
          },
          child: SizedBox(
              width: 400,
              height: 160,
              child: Card(
                color: const Color.fromARGB(255, 188, 226, 198),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.zero, right: Radius.elliptical(20.0, 120.0)),
                  side: BorderSide(
                    color: Colors.black45,
                    width: 3.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 130,
                          width: 100,
                          image: NetworkImage(shop.imageUrl),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              shop.name,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Text(
                            shop.description,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Giá: ${shop.price}',
                              // ignore: prefer_const_constructors
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              final cart = context.read<CartManager>();
                              cart.addItem(shop);
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Đã thêm sản phẩm vào giỏ hàng',
                                    ),
                                    duration: const Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'HỦY',
                                      onPressed: () {
                                        cart.removeSingleItem(shop.id!);
                                      },
                                    ),
                                  ),
                                );
                            },
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ])
                  ],
                ),
              )),
        ));
  }
}
