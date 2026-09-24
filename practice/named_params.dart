// 自主实践2：命名参数设计
// 为"实验报告生成器"设计函数签名，给出三种调用方式

/// 生成实验报告
///
/// [studentName] 学生姓名（必填）
/// [studentId] 学号（必填）
/// [experimentNo] 实验编号（必填）
/// [course] 课程名称，默认"移动应用开发"
/// [score] 分数，可选
/// [format] 输出格式，默认markdown
/// [includeCode] 是否包含代码，默认false
String generateReport({
  required String studentName,
  required String studentId,
  required String experimentNo,
  String course = '移动应用开发',
  int? score,
  String format = 'markdown',
  bool includeCode = false,
}) {
  var lines = <String>[];

  if (format == 'markdown') {
    lines.add('# 实验报告：$experimentNo');
    lines.add('');
    lines.add('**课程**：$course');
    lines.add('**姓名**：$studentName');
    lines.add('**学号**：$studentId');
    if (score != null) {
      lines.add('**成绩**：$score');
    }
    lines.add('**包含代码**：${includeCode ? "是" : "否"}');
  } else {
    lines.add('实验报告：$experimentNo');
    lines.add('课程：$course');
    lines.add('姓名：$studentName');
    lines.add('学号：$studentId');
    if (score != null) {
      lines.add('成绩：$score');
    }
    if (includeCode) {
      lines.add('（含代码附录）');
    }
  }

  return lines.join('\n');
}

void main() {
  // 调用方式一：最简调用，只传必填参数
  var r1 = generateReport(
    studentName: '李桐',
    studentId: '20251060003',
    experimentNo: '实验二',
  );
  print('--- 调用一（仅必填参数）---');
  print(r1);
  print('');

  // 调用方式二：带成绩和输出格式
  var r2 = generateReport(
    studentName: '李桐',
    studentId: '20251060003',
    experimentNo: '实验二',
    score: 92,
    format: 'text',
  );
  print('--- 调用二（带成绩+纯文本格式）---');
  print(r2);
  print('');

  // 调用方式三：全参数
  var r3 = generateReport(
    studentName: '李桐',
    studentId: '20251060003',
    experimentNo: '实验二',
    course: '移动应用开发与实践',
    score: 95,
    format: 'markdown',
    includeCode: true,
  );
  print('--- 调用三（全参数）---');
  print(r3);
}
