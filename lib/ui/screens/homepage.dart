import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/home.dart';
import 'package:myapp/ui/widgets/info_user.dart';
import '../manager/cart_manager.dart';
import '../widgets/card_shop.dart';
import '../manager/shop_manager.dart';
import '../../screens.dart';
import '../widgets/top_right_badge.dart';
import 'package:provider/provider.dart';

enum FilterOptions { favorites, all }

class ShopOverviewScreen extends StatefulWidget {
  const ShopOverviewScreen({super.key});

  @override
  State<ShopOverviewScreen> createState() => _ShopOverviewScreenState();
}

class _ShopOverviewScreenState extends State<ShopOverviewScreen> {
  late Future<void> _fetchShops;
  @override
  void initState() {
    super.initState();
    _fetchShops = context.read<ShopManager>().fetchProducts();
  }

  int _selectedIndex = 0;
  String titlePage = '';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(''),
    InfoUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
            width: 150,
            height: 50,
            color: Color.fromARGB(255, 247, 245, 245),
            image: NetworkImage(
                'https://pbs.twimg.com/media/CyGXXiZWEAEznfZ.png')),
        actions: <Widget>[
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: _selectedIndex == 1
          ? FutureBuilder(
              future: _fetchShops,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(142, 47, 143, 76)
                              .withOpacity(0.9)),
                      child: Consumer<ShopManager>(
                        builder: (context, shopManager, child) =>
                            ListView.builder(
                          itemCount: shopManager.itemCount,
                          itemBuilder: (BuildContext context, int index) {
                            return CardShop(shopManager.shops[index]);
                          },
                        ),
                      ));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall_sharp),
            label: 'Sản Phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: 'Tài Khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 24, 172, 43),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, CartManager, child) {
        return TopRightBadge(
          data: CartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            // style: IconButton.styleFrom(
            //   foregroundColor: Colors.green,
            //   backgroundColor: Colors.black,
            //   hoverColor: Colors.blue,
            // ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }
}
