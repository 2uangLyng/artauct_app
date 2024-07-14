import 'package:artauct_app/components/loginButton.dart';
import 'package:artauct_app/components/signUpButton.dart';
import 'package:flutter/material.dart';

class GetstartPage extends StatelessWidget {
  const GetstartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size  = MediaQuery.of(context).size;
     return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/getStartBackground.avif'),
                  fit: BoxFit.fitHeight, 
                  alignment: Alignment.centerLeft
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.35), 
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 70, right: 70, top: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 200,),
                  Text(
                  'Welcome to ',
                  style: TextStyle(
                    fontSize: 42, 
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Artauct',
                  style: TextStyle(fontSize: 65, 
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 280,),
                Center(
                  child: Column(
                    children: [
                      Loginbutton(),
                      SizedBox(height: 14,),
                       SignUpButton(),
                    ],
                  ),
                 
                )
              ]      
              ),
            )
          ],
        ),
      ),
    );
  }
}