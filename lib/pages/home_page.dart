import 'package:flutter/material.dart';
import '../data/scp_data.dart';
import '../models/SCP.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showEditDialog(SCP scpItem) {
    TextEditingController _itemNumberController =
        TextEditingController(text: scpItem.itemNumber);
    TextEditingController _nameController =
        TextEditingController(text: scpItem.name);
    TextEditingController _dangerClassController =
        TextEditingController(text: scpItem.dangerClass);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit SCP'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _itemNumberController,
                  decoration: const InputDecoration(labelText: 'SCP Number')),
              TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'SCP Name')),
              TextField(
                  controller: _dangerClassController,
                  decoration: const InputDecoration(labelText: 'Danger Class')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedSCP = SCP(
                  itemNumber: _itemNumberController.text,
                  name: _nameController.text,
                  dangerClass: _dangerClassController.text,
                );
                _updateSCP(scpItem, updatedSCP);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog() {
    TextEditingController _itemNumberController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _dangerClassController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New SCP'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: _itemNumberController,
                  decoration: const InputDecoration(labelText: 'SCP Number')),
              TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'SCP Name')),
              TextField(
                  controller: _dangerClassController,
                  decoration: const InputDecoration(labelText: 'Danger Class')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newSCP = SCP(
                  itemNumber: _itemNumberController.text,
                  name: _nameController.text,
                  dangerClass: _dangerClassController.text,
                );
                _addSCP(newSCP);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _updateSCP(SCP oldSCP, SCP newSCP) {
    setState(() {
      final index = scpItems.indexOf(oldSCP);
      if (index != -1) {
        scpItems[index] = newSCP;
      }
    });
  }

  void _addSCP(SCP newSCP) {
    setState(() {
      scpItems.add(newSCP);
    });
  }

  void _deleteSCP(SCP scpToDelete) {
    setState(() {
      scpItems.remove(scpToDelete);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${scpToDelete.name} deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000000), // Black
                Color(0xFF8B0000), // Dark Red
              ],
              stops: [0.0, 1.0], // Smooth transition at the bottom
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                child: const Text(
                  "SCP Foundation",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    hintText: 'Search for something',
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: scpItems.length,
                  itemBuilder: (context, index) {
                    final scpItem = scpItems[index];
                    String backgroundImage = 'assets/bg1.jpg'; // Default image
                    if (index % 4 == 0) {
                      backgroundImage = 'assets/bg1.jpg';
                    } else if (index % 4 == 1) {
                      backgroundImage = 'assets/bg2.png';
                    } else if (index % 4 == 2) {
                      backgroundImage = 'assets/bg3.jpg';
                    } else {
                      backgroundImage = 'assets/bg4.jpg';
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          _showEditDialog(scpItem);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(backgroundImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Text(
                                    '${scpItem.itemNumber} - ${scpItem.name} (${scpItem.dangerClass})',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: () {
                                  _deleteSCP(scpItem);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
