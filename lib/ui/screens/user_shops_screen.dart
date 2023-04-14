import 'package:flutter/material.dart';
import '../../ui/manager/shop_manager.dart';
import '../../ui/screens/edit_shop.dart';
import 'package:provider/provider.dart';

import '../shared/drawer.dart';
import '../widgets/user_product_list_tile.dart';

class UserShopsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserShopsScreen({super.key});

  Future<void> _refreshShop(BuildContext context) async {
    await context.read<ShopManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final shopManagers = context.read<ShopManager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý sản phẩm'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshShop(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshShop(context),
            child: buildUserProductListView(shopManagers),
          );
        },
      ),
    );
  }

  Widget buildUserProductListView(ShopManager shopManagers) {
    return Consumer<ShopManager>(
      builder: (context, shopManager, child) {
        return ListView.builder(
          itemCount: shopManager.shops.length,
          itemBuilder: (context, index) => Column(
            children: [
              UserProductListTile(shopManager.shops[index]),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditShop.routeName,
        );
      },
    );
  }
}
