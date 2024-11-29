import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled33/Anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginEkrani(),
    );
  }
}

class LoginEkrani extends StatefulWidget {



  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

    var tfKullaniciAdi = TextEditingController();
    var tfSifre = TextEditingController();
    var  scaffoldKey = GlobalKey<ScaffoldState>();


   Future<void> girisKonsol() async {
     var ka = tfKullaniciAdi.text;
     var s = tfSifre.text;
     if(ka=='admin' && s=='123'){
       var sp = await SharedPreferences.getInstance();
       sp.setString('KullaniciAdi', ka);
       sp.setString('Sifre', s);
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Anasayfa()));




     }else {
       Text('Giriş Hatalı');
     }
   }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  hintText: 'Kullanici Adi',

                ),
              ),

              TextField(
                obscureText: true,
                controller: tfSifre,
                decoration: InputDecoration(
                  hintText: 'Şifre',

                ),
              ),
              ElevatedButton(onPressed: (){
                girisKonsol();              },
                  child: Text('Giriş Yap'))

            ],
          ),
        ),
      ),

    );
  }
}