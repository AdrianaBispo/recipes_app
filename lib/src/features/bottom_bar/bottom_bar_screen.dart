import 'package:flutter/material.dart';

//screen
import '../favorit/favorit_screen.dart';
import '../home/home.dart';
//utils
import '../../shared/utils/color.dart';
class BottomBarScreen extends StatefulWidget {

  const BottomBarScreen({Key? key}) : super(key: key);
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _index = 0;

  late List _screen;
  

  @override
  initState(){
    _screen = [MealsScreen(), FavoritScreen()];
    super.initState();
  }
  final List<String> _titles = ['Cooking App', 'Favorites'];

  void _selected(int value) {
    setState(() {
      _index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.instance.secundaria,
      appBar: AppBar(
              shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: AppColor.instance.primaria,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
              ),

        elevation: 0,
        title: Text(
          _titles[_index],
          style: TextStyle(
            color: AppColor.instance.black,
            fontSize: 30,
            fontFamily: 'RobotoCondensed-Bold',
          ),
        ),
        backgroundColor: AppColor.instance.primaria,
        centerTitle: true,
      ),
      body: _screen[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _selected,
        selectedItemColor: AppColor.instance.primaria,
        selectedFontSize: 1,
        unselectedFontSize: 1,
        iconSize: 30,
        unselectedItemColor: AppColor.instance.unselected,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
