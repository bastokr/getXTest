import 'package:flutter/material.dart';
import 'food.dart';
import 'package:get/get.dart';
import 'controller/controller.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              Text("우리동네 마트"),
              Expanded(
                  child: Column(
                children: [
                  TextField(
                    //   focusNode:  ,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
//_streamSearch.add(text);
                    },
                    decoration: InputDecoration(
                        // hintText: lang(0),
                        border: InputBorder.none,
                        icon: Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Icon(Icons.search))),
                  ),
                  Expanded(child: GalleryContainer(context)),
                ],
              ))
            ],
          ),
        ));
  }
}

class GalleryContainer extends StatelessWidget {
  GalleryContainer(BuildContext context);

  @override
  Widget build(context) {
    return new GridView.extent(
      crossAxisSpacing: 1.0,
      maxCrossAxisExtent: 300.0,
      padding: const EdgeInsets.all(1.0),
      mainAxisSpacing: 1.0,
      children: <Widget>[
        retImage("barrafina", "곤지암샌드위치", "건대 오거리", context),
        retImage("homei", "스터벅스 ", "구이 사거리", context),
        retImage("palomino", "조선의한우", "삼리점", context),
        retImage("petiteoyster", "더후라이팬치킨", "곤지암점", context),
        retImage("royaloak", "한촌설렁탕", "View from top", context),
        retImage("teakha", "수다떠는오징어", "Hill Top", context),
        retImage("traif", "오렌지박스", "Drone View", context),
        retImage("upstate", "티(T)", "Nice Place", context),
        retImage("waffleandwolf", "포커스", "Beautiful", context),
        retImage("barrafina", "서울뚝배기", "Golden Season", context),
        retImage("traif", "하남돼지집", "Ceresole Reale", context),
        retImage("traif", "날라리 포차", "Beautiful Place", context),
        retImage("barrafina", "생활맥주", "View from top", context),
        retImage("petiteoyster", "경성포차", "Hill Top", context),
        retImage("palomino", "엉터리맥주", "Drone View", context),
        retImage("homei", "부야스키콥", "Nice Place", context),
      ],
    );
  }

  Widget retImage(
      String image, String title, String subtitle, BuildContext context) {
    GestureDetector cont = new GestureDetector(
        onTap: () {
          print('test');
          // Navigator.pushNamed(context, "myRoute");
        },
        child: new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
            decoration:
                new BoxDecoration(color: new Color.fromARGB(220, 20, 20, 20)),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      title,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    new Text(
                      subtitle,
                      style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[200],
                          fontSize: 10.0),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                new Icon(
                  Icons.star_border,
                  color: Colors.red,
                )
              ],
            )));

    Stack stack = new Stack(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  print('test');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodApp()),
                  );
                  //
                },
                child: new Image.asset(
                  "images/market/" + image + ".jpg",
                  fit: BoxFit.cover,
                  height: 240.0,
                ))
          ],
        ),
        new Positioned(child: cont, bottom: 0.0, right: 0.0, left: 0.0)
      ],
    );

    return stack;
  }
}
