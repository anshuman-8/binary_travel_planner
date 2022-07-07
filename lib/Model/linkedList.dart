import 'package:binary_travel_planner/Model/binary_tree.dart';

class LinkedList {
  Node? head;

  List<String> displayList(Node head) {
    List<String> li = [];

    return li;
  }

  void add(Node node) {
    Node? curnode = head;
    if (head == null) {
      head = node;
      return;
    } else {
      while (curnode?.next != null) {
        curnode = curnode?.next;
      }
      curnode?.next = node;
    }
  }

  List<String> get list {
    List<String> li = [];
    Node? curnode = head;
    while (curnode != null) {
      li.add(curnode.title);
      curnode = curnode.next;
    }
    return li;
  }
}

class Node {
  // BinaryNode node;
  String title;
  Node? next;

  Node(String this.title) {
    // this.title=title;
    this.next = null;
  }
}
