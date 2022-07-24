import 'package:flutter/material.dart';
import 'package:flutter_app/Items.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppHome> {
  List<Items> itemList = [];

  void setItems() {
    itemList.add(Items(
      title: 'Samsung Galaxy M12',
      price: '\$300',
      subTitle: 'Launch offers include a \$500',
      image: 'images/samsung.jpeg',
    ));
    itemList.add(Items(
        title: 'Redmi Note 10',
        price: '\$250',
        subTitle:
            'Redmi Note 10 will go on sale for the first time in World today.',
        image: 'images/redemi.jpg'));
    itemList.add(Items(
        title: 'OnePlus Nord',
        price: '\$350',
        subTitle:
            'OnePlus Nord users reported some issues with the Android 11 update and the rollout has now been paused.',
        image: 'images/oneplus.jpeg'));
    itemList.add(Items(
        title: 'Motorola Moto G30',
        price: '\$350',
        subTitle:
            'Moto G30 is priced at Rs 20,999 and comes with Android 11 out of the box.',
        image: 'images/moto.jpeg'));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Flutter Slidble'),
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Slidable(
                      actions: [
                        IconSlideAction(
                            foregroundColor: Colors.white,
                            caption: 'Favourite',
                            color: Colors.lightBlue,
                            icon: Icons.favorite_border_outlined,
                            onTap: () {}),
                        IconSlideAction(
                          foregroundColor: Colors.white,
                          caption: 'Contacts',
                          color: Colors.teal,
                          icon: Icons.email_outlined,
                          onTap: () => print('Contacts'),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Details',
                          color: Colors.black87,
                          icon: Icons.more_horiz,
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (cxt) {
                                  return SimpleDialog(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Image.asset(
                                        itemList[index].image,
                                        height: 180,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            itemList[index].title,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            itemList[index].price,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.lightBlue),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(itemList[index].subTitle),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        IconSlideAction(
                          caption: 'Report',
                          color: Colors.red,
                          icon: Icons.report_outlined,
                          onTap: () => print('Delete'),
                        ),
                      ],
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                child: Image.asset(itemList[index].image),
                              ),
                            ),
                            Container(
                              width: 230,
                              padding: EdgeInsets.only(right: 10),
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            itemList[index].title,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            itemList[index].price,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.lightBlue),
                                          )
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(top: 8),
                                      alignment: Alignment.topLeft,
                                      child: Text(itemList[index].subTitle)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )));
  }
}
