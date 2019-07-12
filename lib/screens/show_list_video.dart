import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jacky_tpa/model/jacky_video_model.dart';

class ShowlistVideo extends StatefulWidget {
  @override
  ShowlistVideo_State createState() => ShowlistVideo_State();
}

class ShowlistVideo_State extends State<ShowlistVideo> {
  // Explicit
  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<JackyVideoModel> jackyVideoModels = [];

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference =
        firestore.collection('JackyVideo');
    subscription = await collectionReference.snapshots().listen((response) {
      snapshots = response.documents;

      for (var snapshot in snapshots) {
        String nameVideo = snapshot.data['Name'];
        String detailVideo = snapshot.data['Detail'];
        String pathImage = snapshot.data['PathImage'];
        String pathVideo = snapshot.data['PathVideo'];

        JackyVideoModel jackyVideoModel =
            JackyVideoModel(nameVideo, detailVideo, pathImage, pathVideo);
        setState(() {
          jackyVideoModels.add(jackyVideoModel);
        });

        // print('$pathImage');
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 180.0,
      height: 120.0,
      child: Image.network(
        jackyVideoModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(jackyVideoModels[index].name,
                style: TextStyle(
                  fontSize: 24.0,
                )),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(jackyVideoModels[index].detail),
          )
        ],
      ),
    );
  }

  Widget myDivider() {
    return Divider(
      height: 5.0,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: jackyVideoModels.length,
        itemBuilder: (context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    showImage(index),
                    showText(index),
                  ],
                ),
                myDivider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
