part of '../base.dart';

class Screenpage extends StatefulWidget {
  const Screenpage({Key? key}) : super(key: key);

  @override
  _ScreenpageState createState() => _ScreenpageState();
}

class _ScreenpageState extends State<Screenpage> {
  ///index for navigationbar
  int _currentIndex = 0;

  ///list pages inside screen
  final List<Widget> _pages = [HomePage(), Actorpage(), ProfilePage()];
  final List<String?> _appbarname = [null, 'Actor', 'Profile'];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? null
          : AppBar(
              title: Text(_appbarname[_currentIndex].toString()),
              actions: [
                ButtonComponent(
                  function: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  buttonComponentStyle: ButtonComponentStyle.ButtonIcon,
                  iconData: Icons.search,
                )
              ],
            ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Bottomnavigationbar(
        currentIndex: _currentIndex,
        ontap: onTabTapped,
      ),
      drawer: DrawerComponennts(),
    );
  }
}
