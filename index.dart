import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'বেসিক Flutter ওয়েব অ্যাপ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  // পেজ তালিকা
  final List<Widget> _pages = [
    const DashboardPage(),
    const ProductsPage(),
    const ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমার ওয়েব অ্যাপ'),
        centerTitle: true,
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'মেনু',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('হোম'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('প্রোডাক্টস'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text('যোগাযোগ'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('সেটিংস'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('সেটিংস পেজ এখনো তৈরি করা হয়নি')),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'প্রোডাক্টস',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'যোগাযোগ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ড্যাশবোর্ড পেজ
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'স্বাগতম!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'এটি একটি বেসিক Flutter ওয়েব অ্যাপ। আপনি এর উপর ভিত্তি করে আরও উন্নত ওয়েব অ্যাপ তৈরি করতে পারেন।',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('আরও জানুন বাটন ক্লিক করা হয়েছে')),
                      );
                    },
                    child: const Text('আরও জানুন'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'বৈশিষ্ট্যসমূহ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          FeatureCard(
            icon: Icons.device_hub,
            title: 'রেসপন্সিভ ডিজাইন',
            description: 'সকল ডিভাইসে সুন্দরভাবে দেখা যাবে',
          ),
          FeatureCard(
            icon: Icons.speed,
            title: 'দ্রুত পারফরম্যান্স',
            description: 'Flutter এর দ্রুত রেন্ডারিং ইঞ্জিন ব্যবহার করে তৈরি',
          ),
          FeatureCard(
            icon: Icons.palette,
            title: 'কাস্টমাইজেবল UI',
            description: 'সহজেই UI পরিবর্তন করা যাবে',
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'পরবর্তী আপডেট',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('ডার্ক মোড'),
                    subtitle: Text('সাইট জুড়ে ডার্ক মোড সাপোর্ট'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('অ্যানিমেশন'),
                    subtitle: Text('সুন্দর UI অ্যানিমেশন'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('ডাটা সংরক্ষণ'),
                    subtitle: Text('লোকাল স্টোরেজ ব্যবহার'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}

// প্রোডাক্টস পেজ
class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // প্রোডাক্টের তালিকা (উদাহরণ)
    final List<Map<String, dynamic>> products = [
      {
        'name': 'প্রোডাক্ট ১',
        'price': '১০০০৳',
        'image': Icons.smartphone,
        'description': 'প্রোডাক্ট ১ এর বিবরণ এখানে'
      },
      {
        'name': 'প্রোডাক্ট ২',
        'price': '২০০০৳',
        'image': Icons.laptop,
        'description': 'প্রোডাক্ট ২ এর বিবরণ এখানে'
      },
      {
        'name': 'প্রোডাক্ট ৩',
        'price': '৩০০০৳',
        'image': Icons.headphones,
        'description': 'প্রোডাক্ট ৩ এর বিবরণ এখানে'
      },
      {
        'name': 'প্রোডাক্ট ৪',
        'price': '৪০০০৳',
        'image': Icons.watch,
        'description': 'প্রোডাক্ট ৪ এর বিবরণ এখানে'
      },
      {
        'name': 'প্রোডাক্ট ৫',
        'price': '৫০০০৳',
        'image': Icons.camera,
        'description': 'প্রোডাক্ট ৫ এর বিবরণ এখানে'
      },
      {
        'name': 'প্রোডাক্ট ৬',
        'price': '৬০০০৳',
        'image': Icons.tv,
        'description': 'প্রোডাক্ট ৬ এর বিবরণ এখানে'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'আমাদের প্রোডাক্টস',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          width: double.infinity,
                          child: Icon(
                            product['image'] as IconData,
                            size: 60,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product['price'] as String,
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['description'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${product['name']} কার্টে যোগ করা হয়েছে'),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                ),
                                child: const Text('কার্টে যোগ করুন'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// যোগাযোগ পেজ
class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'যোগাযোগ করুন',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'আমাদের সাথে যোগাযোগ করুন',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'আপনার নাম',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'ইমেইল',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'মোবাইল নম্বর',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'আপনার বার্তা',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.message),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('আপনার বার্তা পাঠানো হয়েছে। আমরা শীঘ্রই যোগাযোগ করব।'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'বার্তা পাঠান',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'আমাদের ঠিকানা',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text('অফিসের ঠিকানা'),
                    subtitle: Text('১২৩, মেইন রোড, ঢাকা, বাংলাদেশ'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('ফোন নম্বর'),
                    subtitle: Text('+৮৮০ ১৭১২৩৪৫৬৭৮'),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text('ইমেইল'),
                    subtitle: Text('info@example.com'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}