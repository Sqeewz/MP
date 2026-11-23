import 'package:flutter/material.dart';

class ActivityFormPage extends StatefulWidget {
  const ActivityFormPage({super.key});

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  String? _selectedCategory;

  static const List<String> _categories = [
    'ออกกำลังกาย',
    'การเรียน',
    'งานบ้าน',
    'พักผ่อน',
    'ทั่วไป',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มกิจกรรม')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ชื่อกิจกรรม: 1-60 ตัว หลังตัดช่องว่างหัวท้าย
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'ชื่อกิจกรรม',
                  hintText: 'เช่น เดินเล่น',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final title = (value ?? '').trim();
                  if (title.isEmpty || title.length > 60) {
                    return 'ต้องใส่ชื่อหรือใส่เกิน 60 ตัวอักษร';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // หมวดหมู่: ต้องเลือก 1 รายการ
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'หมวดหมู่',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('เลือกหมวดหมู่'),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาเลือกหมวดหมู่';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // หมายเหตุ: ไม่บังคับกรอก หากกรอกไม่เกิน 240 ตัว
              TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'หมายเหตุ (ไม่บังคับ)',
                  hintText: 'หากกรอกต้องไม่เกิน 240 ตัวอักษร',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value != null && value.length > 240) {
                    return 'หมายเหตุยาวเกิน (ไม่เกิน 240 ตัวอักษร)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // ปุ่มบันทึก
              ElevatedButton(
                onPressed: _saveActivity,
                child: const Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
