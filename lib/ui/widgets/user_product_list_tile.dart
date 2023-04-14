import 'package:flutter/material.dart';
import 'package:myapp/ui/manager/shop_manager.dart';
import 'package:provider/provider.dart';
import '../../models/shop.dart';
import '../../ui/screens/edit_shop.dart';

class UserProductListTile extends StatelessWidget {
  final Shop shop;

  const UserProductListTile(
    this.shop, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(shop.name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(shop.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(EditShop.routeName, arguments: shop.id);
      },
      color: Theme.of(context).primaryColor,
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        context.read<ShopManager>().deleteProduct(shop.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text(
              'Sản phẩm đã được xóa',
              textAlign: TextAlign.center,
            ),
          ));
      },
      color: Theme.of(context).errorColor,
    );
  }
}
