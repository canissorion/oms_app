import 'package:flutter/material.dart';
import 'package:oms_app/src/services/datos_service.dart';
import 'package:oms_app/src/widgets/header.dart';
import 'package:oms_app/src/widgets/tarjeta_paises.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{

    bool numeric;
    bool alpha;
    Icon orden;
    bool borden;

    @override
    void initState() { 
      super.initState();
      numeric = false;
      alpha = true;
      borden = false;
      orden = Icon(Icons.arrow_upward,color: Colors.white);
    }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {

    final paises = Provider.of<DatosPaisService>(context).paises;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/img/virus.png"),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: orden, 
                      onPressed: (){
                        this.borden == true ?
                        setState(() {
                          this.borden = !this.borden;
                          orden = Icon(Icons.arrow_upward, color: Colors.white);
                          paises.sort((b,a) => b.totalConfirmed.compareTo(a.totalConfirmed));
                        }) :
                        setState(() {
                          this.borden = !this.borden;
                          orden = Icon(Icons.arrow_downward,color: Colors.white);
                          paises.sort((a,b) => b.totalConfirmed.compareTo(a.totalConfirmed));
                        });
                      }
                    ),
                    IconButton(
                      icon: Icon(Icons.sort_by_alpha, color: Colors.white), 
                      onPressed: (){
                        this.alpha == true ?
                        setState(() {
                          this.alpha = !this.alpha;
                          paises.sort((a,b) => b.country.compareTo(a.country));
                        }) :
                        setState(() {
                          this.alpha = !this.alpha;
                          paises.sort((b,a) => b.country.compareTo(a.country));
                        });
                      }
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.4),
                        Text(
                          'COVID OMS - APP',
                          style: TextStyle( 
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                ]
              ),
            ),
          ),
          Expanded(
            child: TarjetaPaises( paises )
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}