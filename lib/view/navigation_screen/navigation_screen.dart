import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truebiller/Themes/app_text_theme.dart';
import 'package:truebiller/constants/constants.dart';
import 'package:truebiller/utils/size_utils.dart';
import 'package:truebiller/view/home_screen/widgets/custom_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  late String title;

  @override
  void initState() {
    title = "Dashboard";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SliderDrawer(
        appBar: SliderAppBar(
          isTitleCenter: false,
          appBarColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: paddingLarge),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.fSize,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 27, 116, 189),
              ),
            ),
          ),
        ),
        key: _sliderDrawerKey,
        sliderOpenSize: 200.fSize,
        slider: _SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();
            setState(() {
              this.title = title;
            });
          },
        ),
        child: _ContentArea(title: title),
      ),
    );
  }
}

class _SliderView extends StatefulWidget {
  final Function(String)? onItemClick;

  const _SliderView({super.key, this.onItemClick});

  @override
  State<_SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<_SliderView> {
  String _storeName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storeName = prefs.getString('orgName') ?? '';
    logger.d(_storeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: buttonGradient)),
      padding: const EdgeInsets.only(top: 50),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  Image.network('https://your-profile-url.com/profile-pic.jpg')
                      .image,
            ),
          ),
          const SizedBox(height: 15),
          Builder(builder: (context) {
            return Text(
              _storeName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            );
          }),
          const SizedBox(height: 20),
          ...[
            Menu(Icons.dashboard, 'Dashboard'),
            Menu(Icons.receipt, 'Invoices'),
            Menu(Icons.payments, 'Payments'),
            Menu(Icons.analytics, 'Reports'),
            Menu(Icons.settings, 'Settings'),
            Menu(Icons.logout, 'Log Out'),
          ].map(
            (menu) => _SliderMenuItem(
                title: menu.title,
                iconData: menu.iconData,
                onTap: widget.onItemClick),
          ),
        ],
      ),
    );
  }
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      leading: Icon(iconData, color: Colors.white),
      onTap: () => onTap?.call(title),
    );
  }
}

class _ContentArea extends StatelessWidget {
  final String title;

  const _ContentArea({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: _buildContent(title),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(String title) {
    switch (title) {
      case 'Dashboard':
        return const Center(child: Text('Dashboard Overview'));
      case 'Invoices':
        return const Center(child: Text('Invoice Management'));
      case 'Payments':
        return const Center(child: Text('Payments Overview'));
      case 'Reports':
        return const Center(child: Text('Generate Reports'));
      case 'Settings':
        return const Center(child: Text('System Settings'));
      case 'Log Out':
        return const Center(child: Text('Log Out and Exit'));
      default:
        return Center(child: Text('Content for $title'));
    }
  }
}
