import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            floatingActionButton:
                FloatingActionButton(onPressed: () {}, child: Icon(Icons.menu)),
           appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
    
              title: Text(
                'Abuy Pet Shop',
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: <
                        Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: const Text(
                    'DOG 🐕',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.3,
                        height: 1.2,
                        fontWeight: FontWeight.w900),
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 240,
                  child: StreamBuilder(
                      stream: db.collection('anjing').snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                                  onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Detail(
                                                  documentSnapshot:
                                                      documentSnapshot)));
                                    },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                    width: 255,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(1.5, 1.5),
                                          blurRadius: 1.0,
                                          spreadRadius: 2.0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                documentSnapshot['url']
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Ras : ${documentSnapshot['Ras']}\n'
                                            'Umur : ${documentSnapshot['Umur']}\n',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                fontSize: 13,
                                                letterSpacing: 0.01,
                                                wordSpacing: 0.01,
                                                color: Colors.black45),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          );
                        }
                      })),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: const Text(
                    'CAT 🐈',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.3,
                        height: 1.2,
                        fontWeight: FontWeight.w900),
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 240,
                  child: StreamBuilder(
                      stream: db.collection('kucing').snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                                  onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Detail(
                                                  documentSnapshot:
                                                      documentSnapshot)));
                                    },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                    width: 255,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(1.5, 1.5),
                                          blurRadius: 1.0,
                                          spreadRadius: 2.0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                documentSnapshot['url']
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Ras : ${documentSnapshot['Ras']}\n'
                                            'Umur : ${documentSnapshot['Umur']}\n',
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                fontSize: 13,
                                                letterSpacing: 0.01,
                                                wordSpacing: 0.01,
                                                color: Colors.black45),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          );
                        }
                      })),
            ]))));
  }
}
