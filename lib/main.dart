import 'package:flutter/material.dart';

void main() {
  runApp(const ShreejeeSurveyor());
}

class ShreejeeSurveyor extends StatelessWidget {
  const ShreejeeSurveyor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shreejee Surveyor',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123B5D),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ================= HOME =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF123B5D),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'SHREEJEE SURVEYOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // LOGO / HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: const Color(0xFF123B5D),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 58,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'SHREEJEE SURVEYOR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123B5D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Y. M. DHUNDHALAVA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '📞 8487847474',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _menuButton(
              context,
              Icons.add_location_alt,
              'નવી જમીન માપણી',
              'New Land Survey',
              const Color(0xFF167C80),
              const SurveyPage(),
            ),

            _menuButton(
              context,
              Icons.gps_fixed,
              'GPS Survey',
              'GPS દ્વારા જમીન માપો',
              const Color(0xFF2E6F40),
              const GpsPage(),
            ),

            _menuButton(
              context,
              Icons.square_foot,
              'Area Calculator',
              'જમીનનું ક્ષેત્રફળ ગણો',
              const Color(0xFF7A5C00),
              const AreaPage(),
            ),

            _menuButton(
              context,
              Icons.straighten,
              'Distance Measure',
              'અંતર માપો',
              const Color(0xFF6A4C93),
              const DistancePage(),
            ),

            _menuButton(
              context,
              Icons.folder_copy,
              'Saved Survey',
              'સાચવેલી માપણી જુઓ',
              const Color(0xFF315C8A),
              const SavedPage(),
            ),

            _menuButton(
              context,
              Icons.picture_as_pdf,
              'PDF Report',
              'Survey Report બનાવો',
              const Color(0xFF9B2C2C),
              const PdfPage(),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF123B5D),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CONTACT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Y. M. DHUNDHALAVA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '8487847474',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '© Shreejee Surveyor',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    Widget page,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 82,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}

// ================= NEW SURVEY =================

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final owner = TextEditingController();
  final village = TextEditingController();
  final taluka = TextEditingController();
  final district = TextEditingController();
  final surveyNo = TextEditingController();
  final notes = TextEditingController();

  @override
  void dispose() {
    owner.dispose();
    village.dispose();
    taluka.dispose();
    district.dispose();
    surveyNo.dispose();
    notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('નવી જમીન માપણી'),
        backgroundColor: const Color(0xFF167C80),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _field(owner, 'માલિકનું નામ', Icons.person),
            _field(village, 'ગામ', Icons.location_city),
            _field(taluka, 'તાલુકો', Icons.map),
            _field(district, 'જિલ્લો', Icons.location_on),
            _field(surveyNo, 'Survey Number', Icons.numbers),
            _field(notes, 'નોંધ', Icons.note),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Survey information તૈયાર છે. GPS Surveyથી માપણી શરૂ કરો.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text(
                  'Survey માહિતી સાચવો',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// ================= GPS =================

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS Survey'),
        backgroundColor: const Color(0xFF2E6F40),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFF2E6F40),
                  width: 2,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 80,
                      color: Color(0xFF2E6F40),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'GPS MAP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Google Maps GPS Module',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'GPS module Android versionમાં જોડવામાં આવશે.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.gps_fixed),
                label: const Text(
                  'GPS શરૂ કરો',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Survey Result',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('Area: -- m²'),
                    Text('Area: -- Sq.ft'),
                    Text('Perimeter: -- m'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= AREA =================

class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final length = TextEditingController();
  final width = TextEditingController();

  double area = 0;

  void calculate() {
    final l = double.tryParse(length.text) ?? 0;
    final w = double.tryParse(width.text) ?? 0;

    setState(() {
      area = l * w;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Calculator'),
        backgroundColor: const Color(0xFF7A5C00),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: length,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'લંબાઈ (Meter)',
                prefixIcon: Icon(Icons.straighten),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: width,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'પહોળાઈ (Meter)',
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: calculate,
                child: const Text(
                  'Calculate Area',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'પરિણામ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${area.toStringAsFixed(2)} m²',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7A5C00),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(area * 10.7639).toStringAsFixed(2)} Sq.ft',
                    ),
                    Text(
                      '${(area / 4046.856).toStringAsFixed(4)} Acre',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= DISTANCE =================

class DistancePage extends StatefulWidget {
  const DistancePage({super.key});

  @override
  State<DistancePage> createState() => _DistancePageState();
}

class _DistancePageState extends State<DistancePage> {
  final distance = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final meter = double.tryParse(distance.text) ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Distance Measure'),
        backgroundColor: const Color(0xFF6A4C93),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: distance,
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(
                labelText: 'Distance in Meter',
                prefixIcon: Icon(Icons.straighten),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '${meter.toStringAsFixed(2)} Meter',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(meter * 3.28084).toStringAsFixed(2)} Feet',
                    ),
                    Text(
                      '${(meter / 1000).toStringAsFixed(3)} Kilometer',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= SAVED =================

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Survey'),
        backgroundColor: const Color(0xFF315C8A),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.folder_open,
              size: 90,
              color: Color(0xFF315C8A),
            ),
            const SizedBox(height: 15),
            const Text(
              'Saved Survey',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'હજુ કોઈ Survey સાચવાયેલ નથી.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add),
              label: const Text('નવી Survey'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PDF =================

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Report'),
        backgroundColor: const Color(0xFF9B2C2C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Icon(
              Icons.picture_as_pdf,
              size: 100,
              color: Color(0xFF9B2C2C),
            ),
            const SizedBox(height: 15),
            const Text(
              'Survey Report',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'PDF Report module અહીંથી તૈયાર થશે.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'PDF module final Android buildમાં જોડાશે.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text(
                  'Create PDF Report',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
