// 独立研究3：dart format规范实践
// 这个文件故意写得格式混乱，用来对比格式化前后的效果

void main() {
  var nums = [1, 2, 3, 4, 5];
  var sum = 0;
  for (final n in nums) {
    sum += n;
  }
  print('总和: $sum');
  if (sum > 10) {
    print('大于10');
  } else {
    print('小于等于10');
  }
}

String gradeOf(int score) {
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  return '不及格';
}

void printGrades(List<int> scores) {
  for (final s in scores) {
    print('$s -> ${gradeOf(s)}');
  }
}
