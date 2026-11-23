## 1. โค้ดฟอร์มและกฎตรวจข้อมูล (`lib/screens/activity_form_page.dart`)

### 1.1 กฎตรวจชื่อกิจกรรม (1–60 ตัว หลังตัดช่องว่างหัวท้าย)
```dart
validator: (value) {
  final title = (value ?? '').trim();
  if (title.isEmpty || title.length > 60) {
    return 'ต้องใส่ชื่อหรือเกิน 60 ตัวอักษร';
  }
  return null;
},
```

### 1.2 กฎตรวจหมวดหมู่ (ต้องเลือก 1 รายการ)
```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'กรุณาเลือกหมวดหมู่';
  }
  return null;
},
```

### 1.3 กฎตรวจหมายเหตุ (ไม่บังคับ หากกรอกไม่เกิน 240 ตัว)
```dart
validator: (value) {
  if (value != null && value.length > 240) {
    return 'หมายเหตุยาวเกิน (ไม่เกิน 240 ตัวอักษร)';
  }
  return null;
},
```

### 1.4 ปุ่ม “บันทึกฉบับร่าง” (กดแล้วตรวจข้อมูลทุกช่อง)
```dart
void _saveDraft() {
  if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ผ่านการตรวจทั้งฟอร์ม'),
      ),
    );
  }
}
```
