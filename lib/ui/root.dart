import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/ui/home/home.dart';

class Pages {
  static const int home = 0;
  static const int cart = 1;
  static const int profile = 2;
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = Pages.home;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _cartKey = GlobalKey();
  GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    Pages.home: _homeKey,
    Pages.cart: _cartKey,
    Pages.profile: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _buildNavigator(_homeKey, Pages.home, const HomeScreen()),
              _buildNavigator(
                  _cartKey,
                  Pages.cart,
                  const Center(
                    child: Text('cart'),
                  )),
              _buildNavigator(
                  _profileKey,
                  Pages.profile,
                  const Center(
                    child: Text('profile'),
                  )),

              // const HomeScreen(),
              // const ArticleScreen(),
              // const SearchScreen(),
              // const ProfileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedScreenIndex,
            onTap: (value) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(label: 'خانه', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'سبد خرید', icon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(
                  label: 'پروفایل', icon: Icon(Icons.person)),
            ],
          ),
        ));
  }

  Widget _buildNavigator(GlobalKey key, pageType, child) {
    return key.currentState == null && selectedScreenIndex != pageType
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                child: child,
                offstage: selectedScreenIndex != pageType,
              ),
            ),
          );
  }
}
