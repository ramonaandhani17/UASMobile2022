import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  final data = FirebaseFirestore.instance;
  final pengguna = FirebaseAuth.instance.currentUser;
  DetailTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text('BELI'),
              onPressed: null,
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Container(
                child: StreamBuilder(
                    stream: data
                        .collection('transaksi')
                        .where('id', isEqualTo: pengguna!.uid.toString())
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (!streamSnapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];

                            return InkWell(
                                onTap: null,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 30, 15, 5),
                                        child: Text(
                                          'Ras : ${documentSnapshot['ras']}\n',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 19,
                                              letterSpacing: 1,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 30, 15, 5),
                                        child: Text(
                                          'Jenis Kelamin : ${documentSnapshot['jk']}\n',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 18,
                                              letterSpacing: 1,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 30, 15, 5),
                                          child: Text(
                                            'Umur : ${documentSnapshot['umur']}\n',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 17,
                                                letterSpacing: 1,
                                                height: 1),
                                          )),
                                    ],
                                  ),
                                ));
                          },
                        );
                      }
                    }))));
  }
}
