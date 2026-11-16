import 'package:flutter/material.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({super.key});

  static const activities = <Map<String, String>>[
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กิจกรรม')),
      body: activities.isEmpty
          ? const Center(child: Text('ยังไม่มีกิจกรรม'))
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final item = activities[index];
                return InkWell(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(item['title']!)),
                          body: Center(child: Text(item['detail']!)),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(item['title']!), Text(item['date']!)],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
