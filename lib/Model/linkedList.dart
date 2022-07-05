import 'package:binary_travel_planner/Model/binary_tree.dart';

class LinkedList {
  Node head;
  LinkedList(this.head);

   List<String> displayList(Node head) {
    List<String> li = [];
    
    return li;
  }
}

class Node {
  BinaryNode node;
  String title;
  Node next;

  Node(this.title, this.node, this.next);
}
