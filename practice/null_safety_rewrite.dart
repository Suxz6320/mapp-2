// 自主实践1：空安全改写
// 下面先放原始有隐患的代码（unsafe版本），再放改写后的安全版本

// ============================================================
// 原始代码 —— 有几处空安全隐患
// ============================================================

void unsafeVersion() {
  String? name;
  String? email;
  String? phone;

  name = '李桐';

  // 隐患1：直接用!断言，万一email是null就崩
  print('邮箱长度: ${email!.length}');

  // 隐患2：不做空判断就拼接字符串，可能输出null
  print('联系方式: $phone');

  // 隐患3：可空变量当非空传给函数
  printName(name);
}

void printName(String name) {
  print('姓名: $name');
}

// ============================================================
// 改写后的安全版本
// ============================================================

void safeVersion() {
  String? name;
  String? email;
  String? phone;

  name = '李桐';

  // 改写1：用?.安全调用，null时返回null而不是崩
  // 这里email是null，所以输出null而不是抛异常
  print('邮箱长度: ${email?.length}');

  // 改写2：用??给个默认值，避免输出null
  print('联系方式: ${phone ?? '未填写'}');

  // 改写3：先判空再调用，或者用?.传递
  if (name != null) {
    printName(name); // 这里Dart会做类型提升，name从String?变成String
  }

  // 另一种写法：用空合并给个默认值
  printName(name ?? '匿名用户');
}

void main() {
  print('--- 不安全版本（注释掉，运行会报错）---');
  // unsafeVersion(); // 取消注释会抛 Null check operator used on a null value

  print('--- 安全版本 ---');
  safeVersion();
}
