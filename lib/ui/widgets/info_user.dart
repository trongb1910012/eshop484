import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_manager.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthManager>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: NetworkImage(
                                "https://img.freepik.com/free-icon/user_318-159711.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.green),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("${auth.email}",
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 20),
              Card(
                color: Colors.white12,
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const ListTile(
                  leading: Icon(Icons.settings, color: Colors.black54),
                  title: Text(
                    'Cài đặt',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white12,
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const ListTile(
                  leading: Icon(Icons.card_giftcard, color: Colors.black54),
                  title: Text(
                    'Quà của bạn',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white12,
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const ListTile(
                  leading: Icon(Icons.event, color: Colors.black54),
                  title: Text(
                    'Khuyến mãi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white12,
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.black54),
                  title: Text(
                    'Hỗ trợ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
              Card(
                color: Colors.white12,
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const ListTile(
                  leading: Icon(Icons.password, color: Colors.black54),
                  title: Text(
                    'Đổi mật khẩu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
