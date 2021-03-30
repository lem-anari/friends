import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
//    var navigationBar = CurvedNavigationBar(
//      items: const <Widget>[
//        Icon(Icons.fitness_center),
//        Icon(Icons.search)
//      ],
//      index: 0,
//      height: 50,
//      color: Colors.white.withOpacity(0.5),
//      buttonBackgroundColor: Colors.white,
//      backgroundColor: Colors.white.withOpacity(0.5),
//      animationCurve: Curves.easeInOut,
//      animationDuration: Duration(milliseconds: 500),
//      onTap: (int index){
//        setState(() => sectionIndex = index);
//      },
//    );

    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('HypeFans '),
          leading: GradientMask(
            child: ImageIcon(AssetImage('images/Union.png'),
              size: 150,
              color: Colors.white,)
          ),

          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
//                  AuthService().logOut();
                },
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                label: SizedBox.shrink())
          ],
        ),
        body: Text('will be'),
//        bottomNavigationBar: navigationBar,
      ),
    );
  }
}


class GradientMask extends StatelessWidget {
  GradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Color(0xFFFF6644), Color(0xFFFF485C), Color(0xFFFF1A6C)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}