## 1. โค้ดโปรเจกต์เชื่อมหน้ารายการกับรายละเอียด

### 1.1 หน้ารายการ (`lib/screens/activity_list_page.dart`)
*ส่วนเปิดหน้ารายละเอียดและส่งข้อมูลกิจกรรมผ่าน `onTap`:*
```dart
onTap: () {
  Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (context) => ActivityDetailPage(activity: activity),
    ),
  );
},
```

### หน้ารายละเอียด (`lib/screens/activity_detail_page.dart`)
*รับข้อมูลกิจกรรมผ่าน constructor และแสดงผลบนหน้าจอ:*
```dart
class ActivityDetailPage extends StatelessWidget {
  final Map<String, String> activity;

  const ActivityDetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity['title'] ?? ''),
      ),
      body: Center(
        child: Text(activity['detail'] ?? ''),
      ),
    );
  }
}
```