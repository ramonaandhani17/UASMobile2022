import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petshop/detailTransaksi.dart';

class Transaksi extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const Transaksi({Key? key, required this.documentSnapshot}) : super(key: key);
  @override
  State<Transaksi> createState() =>
      TransaksiPageState(documentSnapshot: documentSnapshot);
}

class TransaksiPageState extends State<Transaksi> {
  final DocumentSnapshot documentSnapshot;
  TransaksiPageState({Key? key, required this.documentSnapshot});
  final TextEditingController nama = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  final TextEditingController kodepos = TextEditingController();
  final TextEditingController notel = TextEditingController();
  final data = FirebaseFirestore.instance;
  final pengguna = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    nama.dispose();
    alamat.dispose();
    kodepos.dispose();
    notel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                body: Container(
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextFormField(
                          controller: nama,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nama',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextFormField(
                          controller: alamat,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Alamat',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextFormField(
                          controller: kodepos,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Kode pos',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextFormField(
                          controller: notel,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'No Telepon',
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: const BorderSide(
                                          color: Colors.blue)))),
                          onPressed: () {
                            final transaksi = <String, dynamic>{
                              "nama": nama.text,
                              "alamat": alamat.text,
                              "kodepos": kodepos.text,
                              "notel": notel.text,
                              "id":pengguna!.uid.toString(),
                              "ras":documentSnapshot['Ras'].toString(),
                              "jk":documentSnapshot['Jenis Kelamin'].toString(),
                              "umur":documentSnapshot['Umur'].toString(),
                              "harga":documentSnapshot['Harga'].toString(),
                              
                            };
                            data
                                .collection("transaksi")
                                .add(transaksi)
                                .then((DocumentReference doc) => print(doc.id));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTransaksi(
                                        )));
                          },
                          child: const Text('Proses',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                              )),
                        )),
                  ]),
                ))));
  }
}
