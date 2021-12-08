import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evtoelon/models/car.dart';

Widget cardView(BuildContext context,Car car) {
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, '/second', arguments: {'car': car});
    },
    child: Card(
      //color: Colors.greenAccent[100],
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 300,
                height: 150,
                child: Image(
                  image: AssetImage(car.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12,top: 10),
                    child: Text(
                      car.label,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top:10),
                    child: Text(
                      car.info,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top:5),
                    child: Text(
                      car.data,
                      style: const TextStyle(fontSize: 14,color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
