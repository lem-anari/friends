import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Widget _logo(){
      return Padding(
          padding: EdgeInsets.only(top: 35, bottom: 20),
          child: Container(
              child: Column(
                  children: <Widget>[
                    showLogin
                        ? Text('Вход', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,),)
                        : Text('Регистрация', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,)),
                    SizedBox(height: 50,),
                    Image.asset('images/Union.png'),
                    SizedBox(height: 30),
                    Text('HypeFans', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black))
                  ]
              )
          )
      );
    }
//    bool showPass = true;
    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 14, color: Colors.black54),
          decoration: InputDecoration(
              hintStyle: TextStyle( fontSize: 14, color: Colors.black54),
//              errorText: 'Error Text',
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 3)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1),
                  borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
              ),
              suffixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                      data: IconThemeData(color: Colors.black),
                      child: icon
                  )
              )
//                  suffixIcon: GestureDetector(
//                      onTap: () {
//                        showPass = !showPass;
//                        print(showPass);
//                    },
//                  child: IconTheme(
//                          data: IconThemeData(color: Colors.black),
//                          child: showPass ? icon : Icon(Icons.show_chart),
//                        ),
//                    )),
//                  ),
        )));
    }

    Widget _button(String text, void func()){
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Color(0xFFFB5734),//change
        child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        onPressed: (){
          func();
        },
      );
    }

    Widget _form(String label, void func()){
      return Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Email'),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(Icon(null), "Введите свой email..", _emailController, false)
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Пароль'),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(Icon(Icons.remove_red_eye_outlined), "Введите свой пароль..", _passwordController, true)
            ),

            showLogin
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                          Expanded(
                        child: Text('Забыли пароль?', style: TextStyle(color: Color(0xFFFB5734), ),
                            textAlign: TextAlign.end),
                          ),
                        SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, children: [Text('Войти через')])])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Имя'),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 10),
                          child: _input(Icon(null), "Введите свое имя..", _nameController, true)
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.center, children: [Text('Зарегистрироваться через')])
                    ],),
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('images/google.png'),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('images/facebook.png'),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('images/Instagram.png'),
                    iconSize: 50,
                    onPressed: () {},
                  )
            ]),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: _button(label, func)
                )
            )
          ],
        ),
      );
    }

    void _loginButtonAction() async{
      _email = _emailController.text;
      _password = _passwordController.text;

//      if(_email.isEmpty || _password.isEmpty) return;

    }

    void _registerButtonAction() async{
      _email = _emailController.text;
      _password = _passwordController.text;

//      if(_email.isEmpty || _password.isEmpty) return;
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(

          children: <Widget>[
            _logo(),
            SizedBox(height: 30,),
            (
                showLogin
                    ? Column(
                  children: <Widget>[
                    _form('Войти', _loginButtonAction),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40,),
                        Text('Нет аккаунта?', style: TextStyle(fontSize: 16, color: Colors.black)),
                        GestureDetector(
                            child: Text(' Создайте', style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
                            onTap:() {
                              setState((){
                                showLogin = false;
                              });
                            }
                        ),
                      ],
                    )
                  ],
                )
                    : Column(
                  children: <Widget>[
                    _form('Зарегистрироваться', _registerButtonAction),
                    Padding(
                      padding: EdgeInsets.only(left:20, right: 20, top: 16, bottom: 20),
                      child: Text('Регистрируясь, вы соглашаетесь с нашими Условиями предоставления услуг и Политикой конфиденциальности и подтверждаете, что вам не менее 18 лет.',
                          style: TextStyle(fontSize: 12, ),
                        textAlign: TextAlign.center,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Уже есть аккаунт?', style: TextStyle(fontSize: 16, color: Colors.black)),
                        GestureDetector(
                            child: Text(' Войдите', style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
                            onTap:() {
                              setState((){
                                showLogin = true;
                              });
                            }
                        ),
                      ],
                    )
                  ],
                )
            ),
          ],
        )
    ));
  }
}
