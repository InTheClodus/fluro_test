# fluro_test

对fluro使用的封装
简化了Handler(handlerFunc的写法，不需要每添加一个页面就写一次Handler(handlerFunc
使用Bundle来约束传参的类型,不过使用Bundle就无法使用 fluro的 navigateTo 方法

### 使用示例
## 传递多个参数
```dart
        Navigator.pushNamed(context, PageName.home_page.toString(),
            arguments: Bundle()..putInt("id", 12312)..putString("name", "v"));
```
## 传递单个参数
```dart
        Navigator.pushNamed(context, PageName.home_page.toString(),
            arguments: Bundle()..putInt("id", 12312));
```