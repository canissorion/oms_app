import 'package:flutter/material.dart';
import 'package:oms_app/src/models/datos_models.dart';
import 'package:oms_app/src/pages/pais_page.dart';
import 'package:oms_app/src/theme/tema.dart';

class TarjetaPaises extends StatelessWidget {
  
  final List<Country> paises;

  const TarjetaPaises( this.paises );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.paises.length,
      itemBuilder: (BuildContext context, int index) {
        return _Pais( pais: this.paises[index], index: index,);
     },
    );
  }
}

class _Pais extends StatelessWidget {

  final Country pais;
  final int index;

  const _Pais({
    @required this.pais, 
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaisPage(pais,index)),
            );
          },
          child: _TarjetaTopBar(pais,index)
        ),
      ]
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Country pais;
  final int index;

  const _TarjetaTopBar( this.pais, this.index );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.grey[200],Colors.grey[400]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800],
            blurRadius: 8,
            offset: Offset(0, 6)
          )
        ]
      ),
      padding: EdgeInsets.symmetric( horizontal: 10),
      margin: EdgeInsets.only( bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FadeInImage(
            width: MediaQuery.of(context).size.width*0.20,
            placeholder: AssetImage( 'assets/img/giphy.gif' ),
            image: NetworkImage('https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/${pais.countryCode.toLowerCase()}.png'),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('#${index + 1}', 
                style: TextStyle(
                  color: miTema.accentColor,
                  fontSize: MediaQuery.of(context).size.width*0.06
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.005),
              Text('${pais.country}',
                style: TextStyle(
                  color: miTema.textSelectionColor,
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width*0.04,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.005),
              Text('Confirmados: ${pais.totalConfirmed}',
                style: TextStyle( 
                  color: miTema.textSelectionColor,
                  fontSize: MediaQuery.of(context).size.width*0.03
                ),
              ),
            ]
          ),
          Spacer(),
          Container(width: MediaQuery.of(context).size.width*0.02)
        ],
      ),

    );
  }
}