import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutisMIND',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class ActivityPage extends StatelessWidget {
  final String childName;

  const ActivityPage({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('النشاط')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('أهلاً $childName', style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('رجوع'),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();

  String childName = '';

  List<String> activities = ['الألوان', 'الحيوانات', 'الأشكال'];

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AutisMIND')),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'قائمة الأنشطة',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // عرض الأنشطة الموجودة بالـ List
          for (int i = 0; i < activities.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(activities[i], style: const TextStyle(fontSize: 20)),
            ),

          const SizedBox(height: 20),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'اكتبي اسم الطفل',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                childName = nameController.text;
              });
            },
            child: const Text('حفظ الاسم'),
          ),

          const SizedBox(height: 20),

          Text(
            childName,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityPage(childName: childName),
                ),
              );
            },
            child: const Text('افتح النشاط'),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                activities.add('وسائل النقل');
                activities.remove('الحيوانات');
              });
            },
            child: const Text('تعديل الأنشطة'),
          ),
        ],
      ),
    );
  }
}
