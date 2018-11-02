import 'package:flutter/material.dart';
import 'package:flutter_app/common/colorAll.dart';
import 'package:flutter_app/view/Circle.dart';
import 'package:flutter_app/view/Home.dart';
import 'package:flutter_app/view/Me.dart';
import 'package:flutter_app/view/Order.dart';
import 'package:flutter_app/view/Shop.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  var tabImages;
  var _bodys;
  var appBarTitles = ['首页', '购物车', '订单', '生活圈', '我的'];

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: _bodys[_tabIndex],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
             ),
          child: buildBottomNavigationBar()),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: getTabIcon(0),
          title: getTabTitle(0),
        ),
        BottomNavigationBarItem(
          icon: getTabIcon(1),
          title: getTabTitle(1),
        ),
        BottomNavigationBarItem(
          icon: getTabIcon(2),
          title: getTabTitle(2),
        ),
        BottomNavigationBarItem(
          icon: getTabIcon(3),
          title: getTabTitle(3),
        ),
        BottomNavigationBarItem(
          icon: getTabIcon(4),
          title: getTabTitle(4),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _tabIndex,
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }

  void init() {
    tabImages = [
      [
        getTabImage('res/images/tab_home_default.png'),
        getTabImage('res/images/tab_home_click.png'),
      ],
      [
        getTabImage('res/images/tab_shop_default.png'),
        getTabImage('res/images/tab_shop_click.png'),
      ],
      [
        getTabImage('res/images/tab_order_default.png'),
        getTabImage('res/images/tab_order_click.png'),
      ],
      [
        getTabImage('res/images/tab_circle_default.png'),
        getTabImage('res/images/tab_circle_click.png'),
      ],
      [
        getTabImage('res/images/tab_me_default.png'),
        getTabImage('res/images/tab_me_click.png'),
      ]
    ];

    _bodys = [
      HomePage(),
      ShopPage(),
      OrderPage(),
      CirclePage(),
      MePage(),
    ];
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(main_color)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(gray_999999)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
}
