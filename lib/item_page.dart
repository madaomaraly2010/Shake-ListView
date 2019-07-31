import 'package:animated_listview/list_item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
final ListItem listItem;
  ItemPage({this.listItem});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
           appBar: AppBar(title: Text("${listItem.title}"),),
           body: ListView(
             padding: EdgeInsets.all(10.0),
             children: <Widget>[
                 ListTile(title: Text(listItem.title,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                 leading: CircleAvatar(backgroundColor: listItem.color,radius: 30,
                 child: Icon(listItem.icon,color: Colors.white,size: 30.0,)),),
                 ListTile(title: Text(listItem.description))
             ],
           ),
           )
           ;
  }
}