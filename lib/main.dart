import 'package:flutter/cupertino.dart';
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
      'Samsung Galaxy M12',
      '\$300',
      'Launch offers include a \$500',
      'images/samsung.jpeg',
    ));
    itemList.add(Items(
        'Redmi Note 10',
        '\$250',
        'Redmi Note 10 will go on sale for the first time in World today.',
        'images/redemi.jpg'));
    itemList.add(Items(
        'OnePlus Nord',
        '\$350',
        'OnePlus Nord users reported some issues with the Android 11 update and the rollout has now been paused.',
        'images/oneplus.jpeg'));
    itemList.add(Items(
        'Motorola Moto G30',
        '\$350',
        'Moto G30 is priced at Rs 20,999 and comes with Android 11 out of the box.',
        'images/moto.jpeg'));
    setState(() {
      itemList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            onTap: () => print('Favourite')),
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
                          onTap: () => print('More'),
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
                              width: 200,
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

// Container(
// padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
// child: Slidable(
// actionPane: SlidableDrawerActionPane(),
// actionExtentRatio: 0.25,
// child: Container(
// color: Colors.grey,
// child: ListTile(
// leading: CircleAvatar(
// backgroundColor: Colors.lightBlue,
// child: Text('3'),
// foregroundColor: Colors.white,
// ),
// title: Text('Tile n° 3'),
// subtitle: Text('SlidableDrawerDelegate'),
// ),
// ),
// actions: <Widget>[
// IconSlideAction(
// caption: 'Archive',
// color: Colors.amber,
// icon: Icons.archive,
// onTap: () => print('Archive'),
// ),
// IconSlideAction(
// caption: 'Share',
// color: Colors.indigo,
// icon: Icons.share,
// onTap: () => print('Share'),
// ),
// ],
// secondaryActions: <Widget>[
// IconSlideAction(
// caption: 'More',
// color: Colors.black45,
// icon: Icons.more_horiz,
// onTap: () => print('More'),
// ),
// IconSlideAction(
// caption: 'Delete',
// color: Colors.red,
// icon: Icons.delete,
// onTap: () => print('Delete'),
// ),
// ],
// ),
// ),
