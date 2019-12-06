# Flutter_Learn

Flutter学习经验总结


## 常用命令

1.编译：
* `flutter packages get`: 获取flutter packages包

2.运行：
* `flutter run` （默认为debug环境）
* `flutter run --release` (以release模式运行)

3.安装
* 帮助：`flutter -h` 或 `flutter --help`
* 诊断flutter：`flutter doctor`
* 查看flutter版本号：`flutter --version`
* flutter升级：`flutter upgrade`

4.打包apk包：
* 直接打包：
`flutter build apk`
* 64位-release：
`flutter build apk --release --target-platform android-arm64`
* 32位-release：
`flutter build apk --release --target-platform android-arm`
