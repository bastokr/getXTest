import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'controller/controller.dart';

class ListPage extends StatefulWidget {
  @override
  ListPageState createState() => new ListPageState();
}

class ListPageState extends State<ListPage> {
  List data;
  final controller = Get.put(Controller());
  String uri2 = "";
  var url = Uri.https('luckytransportca.cafe24.com', '/GET_GJPDLIST');

  Future<String> getData() async {
    NetworkHelper('luckytransportca.cafe24.com/GET_GJPDLIST')
        .getData()
        .then((value) => {
              setState(() {
                data = value;
              }),
            });

    String jsonString = ''' {
      "result": [
        {
          "id": "1",
          "entryName": "장원영",
          "title": "이쁘다",
          "thumbnail": "http://supercup.co.kr/entryImg/d11be93604df.gif",
          "description": "이쁘게 움직이는 장원영 움짤",
          "regDate": "2018-12-14 15:15:59",
          "url": "http://supercup.co.kr/entry/detail?type=girlIdol&entryId=131",
          "childern" : [
             {  "c_name": "아들 장세우",
              "c_age": "12"
              },
                {  "c_name": "아들 장고래",
              "c_age": "12"
              }
          ]
        },
        {
          "id": "2",
          "entryName": "사나",
          "title": "귀엽다",
          "thumbnail": "http://supercup.co.kr/entryImg/bd7b77a5fc7c.jpg",
          "description": "시상식 사나 클라스",
          "regDate": "2018-11-19 13:30:44",
          "url": "http://supercup.co.kr/entry/detail?type=girlIdol&entryId=56",
          "childern" : [
             {  "c_name": "아들 사나이",
              "c_age": "12"
              },
                {  "c_name": "아들 사나운",
              "c_age": "12"
              }
          ]
        }
      ],
      "code": "100",
      "msg": "success"
    }
    ''';

    var jsonObject = convert.jsonDecode(jsonString) as Map<String, dynamic>;

    var result = jsonObject["result"];
    controller.setJsonObject(jsonObject);
    List<Children> chs = [];
    List<ClassA> chaL = [];
    Children ch = new Children("c_a", "c_b");

    chs.add(ch);

    ClassA a = new ClassA("", "", chs);
    chaL.add(a);
    chaL.add(a);
    controller.setClassAList(chaL);

    //   var itemCount = jsonResponse['totalItems'];
    //   print('Number of books about http: $itemCount.');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      //   var itemCount = jsonResponse['totalItems'];
      //   print('Number of books about http: $itemCount.');
      setState(() {
        data = jsonResponse as List;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return "Success!";
  }

  @override
  initState() {
    // 부모의 initState호출
    super.initState();
    // 이 클래스애 리스너 추가
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return new MaterialApp(
        title: "Test",
        home: Scaffold(
          appBar: new AppBar(
              title: new Text("Listviews"), backgroundColor: Colors.blue),
          body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: new GetBuilder<Controller>(
                builder: (_) => Row(children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return Second();
                        },
                      ));
                    },
                    child: Text(data[index]["pd_name"] + "click test"),
                  ),
                ]),
              ));
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}

class NetworkHelper {
  NetworkHelper(this.url3);

  final String url3;
  var url = Uri.https('luckytransportca.cafe24.com', '/GET_GJPDLIST');
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class Second extends StatelessWidget {
  final Controller ctrl = Get.find();

  @override
  Widget build(context) {
    var result = ctrl.jsonObject["result"] as List;

    return MaterialApp(
        title: "Test",
        home: Scaffold(
          appBar: new AppBar(
              title: new Text("Listviews"), backgroundColor: Colors.blue),
          body: new ListView.builder(
            itemCount: ctrl == null ? 0 : result.length,
            itemBuilder: (BuildContext context, int index) {
              var child = result[index]["childern"] as List;

              return new Card(
                  child: new GetBuilder<Controller>(
                builder: (_) => Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'clicks: ${result[index]["title"]}',
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              //List<String> values = child;
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MaterialApp(
                                        title: "Test",
                                        home: SimpleDialog(
                                          title: Text("Children Value"),
                                          children: [
                                            ...child.map((value) {
                                              return SimpleDialogOption(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(value["c_name"] +
                                                      "click me"));
                                            }),
                                          ],
                                        ));
                                  });
                            },
                            child: Text('click me'),
                          ),
                        ],
                      ),
                      Text("aaa"),
                    ],
                  )),
                ]),
              ));
            },
          ),
        ));
  }
}

/**
 * 
 * 
 *  ListView.builder(
                    itemCount: ctrl == null ? 0 : child.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(children: [
                        Text(
                          'clicks: ${child[index]["c_name"]}',
                        ),
                      ]); 
                    },
                  ),

                  
 */
