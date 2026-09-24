// 控制流演示
// 覆盖：if/else分支、for-in循环、switch、运算符

String gradeOf(int score) {
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  return '不及格';
}

void runFlowDemo() {
  print('========== 控制流演示 ==========');

  // 成绩分级
  var scores = [95, 83, 67, 45];
  for (final s in scores) {
    print('$s 分 -> ${gradeOf(s)}');
  }

  // 运算符：整除 ~/  vs  普通除法 /
  print('7 / 2 = ${7 / 2}');   // 3.5
  print('7 ~/ 2 = ${7 ~/ 2}'); // 3

  // for-in 遍历
  for (final i in [1, 2, 3]) {
    print('第$i题');
  }

  // switch 分支
  var level = gradeOf(83);
  switch (level) {
    case '优':
      print('继续保持');
      break;
    case '良':
      print('还有提升空间');
      break;
    case '中':
      print('需要努力');
      break;
    default:
      print('需要补考');
  }

  // while 循环
  var count = 3;
  while (count > 0) {
    print('倒计时: $count');
    count--;
  }

  print('');
}
