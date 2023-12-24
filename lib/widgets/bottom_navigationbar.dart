import 'package:flutter/material.dart';

class CustomerBottomBar extends StatefulWidget {
  const CustomerBottomBar({super.key});

  @override
  State<CustomerBottomBar> createState() => _CustomerBottomBarState();
}

class _CustomerBottomBarState extends State<CustomerBottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    // const CustomerHome(),
    // const ProductGrid(),
    // const CustomerOrderListPage(),
  ];

  @override
  void initState() {
    super.initState();
    // _getLocation();
  }

  // Future<void> _getLocation() async {
  //   try {
  //     LocationData locationData = await location.getLocation();

  //     print("current location latitude: ${locationData.latitude}");
  //     print("current location longitude: ${locationData.longitude}");
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // logout() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   var userId = prefs.getString('userId');
  //   if (userId == null) {
  //     Get.offAll(const LoginView());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomerNavDrawer(),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/product.png")),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/order-sign-removebg-preview.png")),
            label: 'Order',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 201, 57, 226),
        onTap: _onItemTapped,
      ),
    );
  }
}
