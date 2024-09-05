import 'package:flutter/material.dart';

import '../Widgets/footer.dart';
import 'login.dart';

class favouriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourite list'),
          leading: Container(),
          leadingWidth: 0,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            }, icon: Icon(Icons.output)),
          ],
        ),


      bottomNavigationBar:  Footer(),
    );
  }
}
