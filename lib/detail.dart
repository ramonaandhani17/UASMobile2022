import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshop/transaksi.dart';

class Detail extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const Detail({Key? key, required this.documentSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text('BELI'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Transaksi(documentSnapshot: documentSnapshot)));
              },
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Center(
                child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                    width: 255,
                    height: 255,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(documentSnapshot['url'])),
                      borderRadius: BorderRadius.circular(10),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                  child: Text(
                    'Ras : ${documentSnapshot['Ras']}\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 19, letterSpacing: 1, height: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                  child: Text(
                    'Jenis Kelamin : ${documentSnapshot['Jenis Kelamin']}\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, letterSpacing: 1, height: 1),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                    child: Text(
                      'Umur : ${documentSnapshot['Umur']}\n',
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 17, letterSpacing: 1, height: 1),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 30, 15, 5),
                    child: Text(
                      documentSnapshot['Deskripsi'],
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 16, letterSpacing: 1, height: 1),
                    )),
              ],
            ))));
  }
}
