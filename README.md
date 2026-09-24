# lecture2 - Dart语言基础一：变量、类型、函数与控制流

姓名：李桐  学号：20251060003

## 项目结构

```
mapp-2/
├── dart_basics/              # 案例复现
│   ├── bin/
│   │   ├── dart_basics.dart  # 主入口，调用三组demo
│   │   ├── types_demo.dart   # 变量、类型、字符串插值、空安全四件套
│   │   ├── func_demo.dart    # 函数声明、箭头函数、命名参数、默认值
│   │   └── flow_demo.dart    # if/else、for-in、switch、while
│   ├── pubspec.yaml
│   └── analysis_options.yaml
├── practice/                 # 自主实践
│   ├── null_safety_rewrite.dart   # 空安全改写（前后对照）
│   ├── named_params.dart          # 命名参数设计（实验报告生成器）
│   └── grade_classifier.dart      # 成绩分级器扩展
├── research/                 # 独立研究
│   ├── const_vs_final.dart        # const与final差异实验
│   ├── type_promotion.dart        # 类型提升规则验证
│   ├── format_before.dart         # 格式化前
│   ├── format_after.dart          # 格式化后
│   └── format_diff_record.md      # 格式化对比记录
├── quiz/
│   └── quiz_record.md             # TraeCode对拍记录
├── progress.md               # 进度报告二
└── README.md
```

## 运行方式

```bash
# 案例复现
cd dart_basics
dart run

# 自主实践
cd practice
dart run null_safety_rewrite.dart
dart run named_params.dart
dart run grade_classifier.dart

# 独立研究
cd research
dart run const_vs_final.dart
dart run type_promotion.dart
```

## 技术栈

- Dart SDK 3.13.3
- TraeCode
- Git
