import 'package:flutter/material.dart';

import 'activity_detail_page.dart';
import 'activity_form_page.dart';

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  final List<Map<String, String>> _activities = [
    {'title': 'เดินเล่น', 'date': '24 ต.ค. 2026', 'detail': 'เดินในสวน'},
    {
      'title': 'เดินชมธรรมชาติในสวนสาธารณะกลางแจ้ง',
      'date': '24 ต.ค. 2026',
      'detail': 'เดินในสวน',
    },
    {'title': 'อ่านหนังสือ', 'date': '23 ต.ค. 2026', 'detail': 'อ่าน 20 นาที'},
    {'title': 'ออกกำลังกาย', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'เล่นเกม', 'date': '21 ต.ค. 2026', 'detail': 'เล่นเกม'},
    {'title': 'ทำอาหาร', 'date': '20 ต.ค. 2026', 'detail': 'ทำอาหาร'},
    {
      'title': 'วิ่งออกกำลังกาย',
      'date': '19 ต.ค. 2026',
      'detail': 'วิ่งรอบสนาม 30 นาที',
    },
    {
      'title': 'ซักผ้าและทำความสะอาดห้อง',
      'date': '18 ต.ค. 2026',
      'detail': 'จัดโต๊ะทำงานและกวาดห้อง',
    },
    {
      'title': 'ดูหนัง',
      'date': '17 ต.ค. 2026',
      'detail': 'ดูหนังช่วงค่ำพักผ่อน',
    },
    {
      'title': 'ซื้อของเข้าหอ',
      'date': '16 ต.ค. 2026',
      'detail': 'ซื้อน้ำดื่มและของใช้จำเป็น',
    },
    {
      'title': 'เขียนโค้ดฝึกทักษะ',
      'date': '15 ต.ค. 2026',
      'detail': 'ทบทวนพื้นฐาน Flutter',
    },
  ];

  Future<void> _addActivity() async {
    final newActivity = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const ActivityFormPage()),
    );

    if (newActivity != null) {
      setState(() {
        _activities.insert(0, newActivity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กิจกรรม')),
      body: _activities.isEmpty
          ? const Center(child: Text('ยังไม่มีกิจกรรม'))
          : ListView.builder(
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                final activity = _activities[index];
                return InkWell(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            ActivityDetailPage(activity: activity),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(activity['title']!),
                        Text(activity['date']!),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addActivity,
        icon: const Icon(Icons.add),
        label: const Text('เพิ่มกิจกรรม'),
      ),
    );
  }
}
