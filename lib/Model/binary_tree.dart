class BinaryTree {
  final BinaryNode root;
  static int posNum = 50;
  static List<Map<BinaryNode, String>> _tripList = [];

  BinaryTree(this.root, String title) {
    // this.root = root;
    _tripList.add({root: title});
  }

  static List<Map<BinaryNode, String>> get tripList {
    return [..._tripList];
  }
}

class BinaryNode {
  BinaryNode? left;
  BinaryNode? right;
  final int position;
  final String data;

  BinaryNode(this.left, this.right, this.data, this.position);
}
