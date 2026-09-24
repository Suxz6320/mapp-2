// 函数演示
// 覆盖：箭头函数、可选参数、命名参数与默认值

// 普通函数写法
int add(int a, int b) {
  return a + b;
}

// 箭头函数 —— 单表达式简写
int add2(int a, int b) => a + b;

// 位置可选参数用方括号
String greet(String name, [String? title]) {
  if (title != null) {
    return '$title$name，你好！';
  }
  return '$name，你好！';
}

// 命名参数 —— Flutter组件构造函数的统一风格
void enroll({
  required String name,
  int age = 18,
  String? className,
}) {
  print('--- 选课信息 ---');
  print('姓名: $name');
  print('年龄: $age');
  print('班级: ${className ?? '未分配'}');
}

void runFuncDemo() {
  print('========== 函数演示 ==========');

  print('add(3, 5) = ${add(3, 5)}');
  print('add2(3, 5) = ${add2(3, 5)}');

  // 位置可选参数
  print(greet('李桐'));
  print(greet('李桐', '同学'));

  // 命名参数调用
  enroll(name: '李桐', className: '2班');
  enroll(name: '张三', age: 20);
  // enroll(age: 20); // 编译错误！name是required不能省

  print('');
}
