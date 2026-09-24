// 类型与变量演示
// 覆盖：var推断、内置类型、字符串插值、空安全四件套

void runTypesDemo() {
  print('========== 类型与变量演示 ==========');

  // 2.1 变量声明 —— var靠推断，显式写出来也行
  var title = '第一次作业';   // 推断为String
  int year = 2026;
  double score = 92.5;
  final now = DateTime.now(); // 运行时才能确定
  const pi = 3.14159;         // 编译期常量

  print('title = $title (类型: ${title.runtimeType})');
  print('year = $year, score = $score');
  print('now = $now');
  print('pi = $pi');

  // 2.2 字符串插值：$变量  ${表达式}
  var name = '李桐';
  var studentId = '20251060003';
  print('学生：$name，学号：$studentId，成绩：${score + 5}');

  // 三引号多行字符串
  var info = '''
  多行信息：
  姓名：$name
  学号：$studentId
  ''';
  print(info);

  // 2.3 空安全四件套演示
  print('---------- 空安全 ----------');
  String? nickname; // 可空类型，初始为null

  // ① 安全调用 ?. —— null则短路返回null
  print('nickname?.length = ${nickname?.length}');

  // ② 空合并 ?? —— 左边为null时取右边
  print('nickname ?? 未填写 = ${nickname ?? '未填写'}');

  // 赋值后再用
  nickname = 'hu';
  // ③ 空断言 ! —— 确定非null时使用，为null会抛错
  print('nickname!.length = ${nickname!.length}');

  // ④ late 延迟初始化
  // late String token; // 声明时不赋值，用之前必须赋
  // 详见独立研究部分

  // bool类型：Dart里没有truthy隐式转换
  var isEmpty = name.isEmpty;
  print('name.isEmpty = $isEmpty');
  // 如果写 if(name) 会编译报错，跟JS/Python不一样

  print('');
}
