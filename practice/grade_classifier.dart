// 自主实践3：成绩分级器扩展
// 基础版只处理正常分数，这里扩展：边界值100/0、非法输入（负数、超100、非整数）

/// 成绩分级器
/// 返回等级字符串，非法输入返回错误提示
String classifyGrade(int score) {
  // 边界与非法输入处理
  if (score < 0 || score > 100) {
    return '非法输入：分数必须在0~100之间';
  }

  // 正常分级逻辑
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  if (score > 0) return '不及格';
  // score == 0 的特殊情况
  return '零分';
}

/// 处理可能非整数的情况
String classifyGradeFromString(String input) {
  // 尝试解析为数字
  double? numValue = double.tryParse(input);
  if (numValue == null) {
    return '非法输入：无法解析为数字';
  }

  // 检查是否为整数（允许"95"但不允许"95.5"）
  if (numValue != numValue.roundToDouble()) {
    return '非法输入：分数必须为整数';
  }

  int score = numValue.toInt();
  return classifyGrade(score);
}

void main() {
  print('========== 成绩分级器扩展 ==========');

  // 正常范围测试
  var testCases = [100, 95, 85, 60, 59, 1, 0];
  for (var s in testCases) {
    print('$s -> ${classifyGrade(s)}');
  }

  print('');

  // 非法输入测试
  var invalidCases = [-5, 101, 150, -1];
  for (var s in invalidCases) {
    print('$s -> ${classifyGrade(s)}');
  }

  print('');

  // 字符串解析测试
  var stringCases = ['88', 'abc', '95.5', '0', '100', '-10', '两百'];
  for (var s in stringCases) {
    print('"$s" -> ${classifyGradeFromString(s)}');
  }
}
