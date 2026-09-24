// 独立研究1：const与final差异实验
// 探索过程：尝试用const接收运行时值，观察编译错误

void main() {
  // 实验1：const接编译期常量 —— OK
  const pi = 3.14159;
  const message = 'Hello Dart';
  print('const pi = $pi');
  print('const message = $message');

  // 实验2：final接运行时值 —— OK
  final now = DateTime.now();
  print('final now = $now');

  // 实验3：const接DateTime.now() —— 编译错误！
  // 取消下面这行注释可以看到报错：
  // const wrongTime = DateTime.now();
  //
  // 编译器报错信息：
  // Error: Constant expression expected.
  // const wrongTime = DateTime.now();
  //                  ^^^^^^^^^^^^^^^
  //
  // 原因：DateTime.now()的值在运行时才能确定，
  //       而const要求编译期就能算出来，所以不行。
  //       final没有这个限制，它在运行时首次赋值后就不可变。

  // 实验4：const做构造函数 —— 编译期常量构造
  const point = Point(3, 4);
  print('const point = (${point.x}, ${point.y})');

  // 同样的值，const构造的实例在内存中是同一个
  const p1 = Point(3, 4);
  const p2 = Point(3, 4);
  print('p1 == p2 : ${identical(p1, p2)}'); // true，同一实例

  // final不行，每次new都是新实例
  final f1 = Point(3, 4);
  final f2 = Point(3, 4);
  print('f1 == f2 : ${identical(f1, f2)}'); // false，不同实例
}

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

// ============================================================
// 实验结论
// ============================================================
// 1. const是编译期常量，值必须在编译时就能确定
//    - 能接字面量（数字、字符串、bool）
//    - 能接const构造函数的实例
//    - 不能接DateTime.now()、随机数等运行时值
//
// 2. final是运行时常量，首次赋值后不可变
//    - 可以接运行时计算的值
//    - 每次构造会创建新实例
//
// 3. const比final更"严格"也更"节省"：
//    - 严格：编译期必须能确定值
//    - 节省：相同值的const实例会复用（canonicalized）
//
// 4. 实际使用建议：
//    - 能用const就用const（性能更好）
//    - 不确定或运行时才能取值的用final
//    - Flutter里很多Widget构造函数都标了const，尽量用
