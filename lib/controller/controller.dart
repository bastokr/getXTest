import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0;
  List<ClassA> classAList;
  var jsonObject;

  void increment() {
    count++;
    update();
  }

  void setClassAList(List<ClassA> chaL) {
    this.classAList = chaL;
  }

  void setJsonObject(var jsonObject) {
    this.jsonObject = jsonObject;
  }
}

class ClassA {
  String foo;
  String bar;
  List<Children> child;

  ClassA(this.foo, this.bar, this.child);
}

class Children {
  String c_a;
  String c_b;

  Children(this.c_a, this.c_b);
}
