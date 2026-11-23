## 1. โค้ดโปรเจกต์ที่เปิดฟอร์มและแสดงกิจกรรมที่เพิ่ม

### 1.1 หน้ารายการ (`lib/screens/activity_list_page.dart`)
*ฟังก์ชันเปิดฟอร์ม รอรับข้อมูล และอัปเดต State รายการใหม่:*
```dart
Future<void> _addActivity() async {
  final newActivity = await Navigator.push<Map<String, String>>(
    context,
    MaterialPageRoute(
      builder: (context) => const ActivityFormPage(),
    ),
  );

  if (newActivity != null) {
    setState(() {
      _activities.insert(0, newActivity);
    });
  }
}
```

*ปุ่มกดเปิดฟอร์ม (FloatingActionButton):*
```dart
floatingActionButton: FloatingActionButton.extended(
  onPressed: _addActivity,
  icon: const Icon(Icons.add),
  label: const Text('เพิ่มกิจกรรม'),
),
```

### 1.2 หน้าฟอร์ม (`lib/screens/activity_form_page.dart`)
*ส่วนส่งข้อมูลกิจกรรมกลับด้วย `Navigator.pop`:*
```dart
void _saveActivity() {
  if (_formKey.currentState!.validate()) {
    final newActivity = <String, String>{
      'title': _titleController.text.trim(),
      'date': '23 พ.ย. 2026',
      'detail': _noteController.text.trim().isEmpty
          ? _selectedCategory!
          : '${_selectedCategory!} - ${_noteController.text.trim()}',
    };
    Navigator.pop(context, newActivity);
  }
}
```
