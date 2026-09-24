# dart format 规范实践记录

## 操作过程

1. 先手写一份格式混乱的代码 `format_before.dart`（缩进不统一、空格随意、大括号挤在一行）
2. 复制一份为 `format_after.dart`，执行 `dart format format_after.dart`
3. 逐行对比格式化前后的差异

## 格式化前后对比

### main函数

**格式化前：**
```dart
void main(){
var nums=[1,2,3,4,5];
var sum=0;
for(final n in nums){sum+=n;}
print('总和: $sum');
if(sum>10){print('大于10');}else{print('小于等于10');}
}
```

**格式化后：**
```dart
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
```

### gradeOf函数

**格式化前：**
```dart
String  gradeOf(int   score){
if(score>=90)return '优';
```

**格式化后：**
```dart
String gradeOf(int score) {
  if (score >= 90) return '优';
```

## 主要改动汇总

| 改动类型 | 说明 |
|---------|------|
| 函数名后空格 | `main(){` → `main() {` |
| 运算符两侧空格 | `sum>10` → `sum > 10`，`nums=[1,2,3]` → `nums = [1, 2, 3]` |
| 多余空格删除 | `String  gradeOf(int   score)` → `String gradeOf(int score)` |
| 单行展开为多行 | `{sum+=n;}` → 三行，左花括号换行后缩进 |
| 逗号后空格 | `[1,2,3,4,5]` → `[1, 2, 3, 4, 5]` |
| 统一缩进2空格 | 原来没有缩进或缩进不一致 |
| else换行 | `}else{` → `} else {` |

## 结论

dart format的规则比较固定，主要做这几件事：
1. 统一2空格缩进
2. 运算符两侧加空格
3. 逗号后加空格
4. 单行代码块展开为多行（花括号独占一行）
5. 清理多余空格

日常写代码不用太纠结格式，写完跑一遍`dart format`就行。配合`dart analyze`可以同时检查格式和静态分析问题。
