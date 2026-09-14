import 'package:flutter/material.dart';

void main() {
  runApp(const DriveVaultApp());
}

class DriveVaultApp extends StatelessWidget {
  const DriveVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DriveVault',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> cars = [
    {
      'name': 'BMW M4',
      'type': 'Performance',
      'image':
          'https://images.unsplash.com/photo-1555215695-3004980ad54e?auto=format&fit=crop&w=900&q=80',
      'price': '\$78,100',
    },
    {
      'name': 'Porsche 911',
      'type': 'Sports',
      'image':
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=900&q=80',
      'price': '\$116,050',
    },
    {
      'name': 'Ford Mustang',
      'type': 'Muscle',
      'image':
          'https://images.unsplash.com/photo-1584345604476-8ec5e12e42dd?auto=format&fit=crop&w=900&q=80',
      'price': '\$42,995',
    },
  ];

  String search = '';
  int selectedCategory = 0;
  final Set<String> favorites = {};

  List<Map<String, dynamic>> get filteredCars {
    const categories = [
      'All',
      'Performance',
      'Sports',
      'Muscle',
    ];

    return cars.where((car) {
      final matchesSearch = car['name']
          .toString()
          .toLowerCase()
          .contains(search.toLowerCase());

      final matchesCategory = selectedCategory == 0 ||
          car['type'] == categories[selectedCategory];

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D10),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF0B0D10),
            floating: true,
            title: const Text(
              'DRIVEVAULT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Cars'),
              ),
              const SizedBox(width: 20),
            ],
          ),

          // Hero section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 50, 40, 35),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FIND YOUR\nNEXT RIDE.',
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.w900,
                          height: 0.95,
                          letterSpacing: -2,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'A small collection of cars worth looking at.',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: 420,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              search = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search cars...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: const Color(0xFF171A1F),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: Row(
                    children: List.generate(4, (index) {
                      const categories = [
                        'All',
                        'Performance',
                        'Sports',
                        'Muscle',
                      ];

                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(categories[index]),
                          selected: selectedCategory == index,
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),

          // Car cards
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 60),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final columns =
                          constraints.maxWidth > 850 ? 3 : 1;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount: filteredCars.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.82,
                        ),
                        itemBuilder: (context, index) {
                          final car = filteredCars[index];
                          final isFavorite =
                              favorites.contains(car['name']);

                          return Card(
                            color: const Color(0xFF15181D),
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.network(
                                        car['image'],
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: Icon(
                                              Icons.directions_car,
                                              size: 60,
                                            ),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        top: 12,
                                        right: 12,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.black.withValues(
                                            alpha: 0.65,
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFavorite
                                                  ? Colors.redAccent
                                                  : Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (isFavorite) {
                                                  favorites.remove(
                                                    car['name'],
                                                  );
                                                } else {
                                                  favorites.add(
                                                    car['name'],
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        car['type'],
                                        style: TextStyle(
                                          color:
                                              Colors.grey.shade500,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        car['name'],
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        car['price'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                              FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}