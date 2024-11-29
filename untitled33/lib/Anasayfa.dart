import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  String? spKullaniciAdi ;
  String? spSifre;

  Future<void> oturumBilgisiOku() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      spKullaniciAdi = sp.getString('KullaniciAdi') ?? 'yok';
      spSifre = sp.getString('Sifre') ?? 'yok';

    });

  }
  @override
  void initState() {
oturumBilgisiOku();
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anasayfa'),
        actions: [
          IconButton(onPressed: (){

          },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kullanici Adi: $spKullaniciAdi',style: TextStyle(
                fontSize: 30,

              ),),
              Text('Şifre: $spSifre ',style: TextStyle(
                fontSize: 30,


              ),)

            ],
          ),
        ),
      ),

    );
  }
}
