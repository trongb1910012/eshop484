import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.green,
                    color: Colors.white60,
                    child: SizedBox(
                      width: 400,
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Flexible(
                              child: SizedBox(
                                  width: 300,
                                  height: 100,
                                  child: Image(
                                      image: NetworkImage(
                                          'https://eshops.vn/assets/images/logo_mail-removebg-preview.png'))),
                            ),
                            Text(
                              'Cửa Hàng Điện Tử',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Sản phẩm đa dạng, chất lượng',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                      ),
                                      Text('Uy Tín')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.high_quality),
                                      Text('Chất lượng')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.lock),
                                      Text('Bảo mật')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.check_box),
                                      Text('Chế độ đổi trả dễ dàng')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.airport_shuttle),
                                      Text('Vận chuyển nhanh chóng')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1000,
                              child: ElevatedButton(
                                onPressed: () => 'Null',
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 57, 126, 93),
                                          width: 2)),
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.accessibility),
                                      Text('Bán hàng đảm bảo, dễ dàng truy cập')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
