// 独立研究2：类型提升验证
// 探索：可空变量在if判空后，能否直接当非空用？

void main() {
  // 实验1：基本类型提升
  String? name = getName();
  if (name != null) {
    // 这里name被提升为String（非空），可以直接调用String方法
    print('长度: ${name.length}');
    print('大写: ${name.toUpperCase()}');

    // 传给需要String参数的函数也OK
    printName(name); // 不需要name!
  }

  // 实验2：三元运算符中的类型提升
  String? email = getEmail();
  var display = (email != null) ? email.toUpperCase() : '无邮箱';
  print('邮箱: $display');

  // 实验3：if判空后在闭包中使用 —— 不会提升！
  String? nickname = getNickname();
  if (nickname != null) {
    // 以下代码在旧版Dart可能报错，因为闭包可能延迟执行
    // 但Dart 3对局部变量做了改进，这里实际能通过
    var callback = () {
      print('昵称: $nickname'); // 这里nickname仍然是String?
    };
    callback();
  }

  // 实验4：&& 短路判空
  String? city = getCity();
  if (city != null && city.length > 3) {
    print('城市名较长: $city');
  }

  // 实验5：判空后重新赋值为null —— 编译器不会跟踪这个变化
  String? hobby = getHobby();
  if (hobby != null) {
    hobby = null; // 重新赋值为null
    // print(hobby.length); // 编译错误！hobby可能为null
    print('hobby被清空了');
  }
}

String? getName() => '李桐';
String? getEmail() => 'litong@example.com';
String? getNickname() => '小桐';
String? getCity() => 'Beijing';
String? getHobby() => '编程';

void printName(String name) {
  print('姓名: $name');
}

// ============================================================
// 实验结论
// ============================================================
// 1. Dart支持局部变量的类型提升（type promotion）：
//    可空变量在if (x != null)块内会被自动当作非空类型使用
//
// 2. 类型提升的适用条件：
//    - 局部变量（不能是类的字段/全局变量，因为可能在其他地方被修改）
//    - 在判空分支内有效
//    - 变量在分支内没有被重新赋值
//
// 3. 闭包中的行为：Dart 3对局部变量在闭包中也做了类型提升支持，
//    但如果是类的实例字段则不会提升（因为可能在闭包执行前被其他代码修改）
//
// 4. 类型提升的意义：减少不必要的!操作符使用，代码更安全也更简洁
//    - 能用类型提升就不用!，因为!是"信任我非null"的断言
//    - 类型提升是编译器帮你做了安全的保证
