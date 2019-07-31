import 'package:animated_listview/item_page.dart';
import 'package:animated_listview/list_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'math_helper.dart';



class CardItem extends StatefulWidget {
  final ListItem listItem;
  
  CardItem({Key key, this.listItem}) : super(key: key);

  @override
  CardItemState createState() => CardItemState();
}

class CardItemState extends State<CardItem> with TickerProviderStateMixin {
  AnimationController animationController;

  double _width;

  double _height;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ItemPage(
                  listItem: widget.listItem,
                );
              }));
            }
          });
    super.initState();
  }

  open() {
    animationController.reset();
    animationController.forward();
  }

  stop() {
    animationController.reset();
  }

  _buildCard() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: widget.listItem.color,radius: 40.0,
             child: Icon(widget.listItem.icon,size: 30,color: Colors.white,),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.listItem.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),

          //  Padding(
          //    padding: const EdgeInsets.all(8.0),
          //    child: Text(widget.listItem.description,style: TextStyle(color: Colors.grey),softWrap: true,),
          //  ),
          // ButtonBar(
          //   children: <Widget>[
          //     RaisedButton(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0)),
          //       color: Colors.green,
          //       child: Row(
          //         children: <Widget>[
          //           Text("Add",
          //               style: TextStyle(
          //                 color: Colors.white,
          //               )),
          //           Icon(
          //             Icons.add,
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //       onPressed: () {},
          //     ),
          //     RaisedButton(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0)),
          //       color: Colors.red,
          //       child: Row(
          //         children: <Widget>[
          //           Text("Delete",
          //               style: TextStyle(
          //                 color: Colors.white,
          //               )),
          //           Icon(
          //             Icons.delete,
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //       onPressed: () {},
          //     )
          //   ],
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        return _buildAnimatedCardShake();    
    }
  

  _buildAnimatedCardShake() {
    return AnimatedBuilder(
      animation: animationController,
      child: _buildCard(),
      builder: (context, child) {
        double v = math.sin(animationController.value * math.pi * 10.0) * 10;
        return Transform.translate(
          offset: Offset(v, 0),
          child: child,
        );
      },
    );
  }

}
