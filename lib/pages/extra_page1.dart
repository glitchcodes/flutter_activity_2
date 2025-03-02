import 'package:flutter/material.dart';
import 'package:sample_project/main.dart'; // Import your main.dart file
import 'package:flutter/services.dart'; // Import for TextInputFormatter


class ExtraPage1 extends StatefulWidget {
  const ExtraPage1({super.key});



  @override
  _ExtraPage1State createState() => _ExtraPage1State();
}

DateTime? _selectedDate;
class _ExtraPage1State extends State<ExtraPage1> {


  final _formKey = GlobalKey<FormState>();
  final _scpNameController = TextEditingController();
  final _scpClassController = TextEditingController();
  final _containmentProceduresController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateOfDiscoveryController = TextEditingController();
  final _possibleCasualtiesController = TextEditingController();
  final _finalRemarksController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateOfDiscoveryController.text =
        "${picked.toLocal()}".split(' ')[0]; // Format the date
      });
    }
  }

  @override
  void dispose() {
    _scpNameController.dispose();
    _scpClassController.dispose();
    _containmentProceduresController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _dateOfDiscoveryController.dispose();
    _possibleCasualtiesController.dispose();
    _finalRemarksController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      // Here you can process the form data, e.g., send it to a server.
      print('SCP Name: ${_scpNameController.text}');
      print('SCP Class: ${_scpClassController.text}');
      print('Containment Procedures: ${_containmentProceduresController.text}');
      print('Description: ${_descriptionController.text}');
      print('Location: ${_locationController.text}');
      print('Date of Discovery: ${_dateOfDiscoveryController.text}');
      print('Possible Casualties: ${_possibleCasualtiesController.text}');
      print('Final Remarks: ${_finalRemarksController.text}');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text(
          'Register New SCP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1C1C1C), // Dark background
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/4.png'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SCP Name
                        _buildTextField(
                          controller: _scpNameController,

                          hintText: 'Enter SCP Name',
                          maxLength: 255,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter SCP Name';
                            }
                            return null;
                          },
                        ),
                        // SCP Class
                        _buildTextField(
                          controller: _scpClassController,
                          maxLength: 255,
                          hintText: 'Enter SCP Class',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter SCP Class';
                            }
                            return null;
                          },
                        ),
                        // Containment Procedures and Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextField(
                              maxLength: 255,
                              width: MediaQuery.of(context).size.width * 0.3,
                              controller: _containmentProceduresController,
                              hintText: 'Containment Procedures',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Containment Procedures';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              width: MediaQuery.of(context).size.width * 0.3,
                              controller: _descriptionController,
                              maxLength: 255,
                              hintText: 'Description',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Description';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        // Location, Date of Discovery, Possible Casualties
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextField(
                              width: MediaQuery.of(context).size.width * 0.2,
                              maxLength: 255,
                              controller: _locationController,
                              hintText: 'Location',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Location';
                                }
                                return null;
                              },
                            ),
                            _buildDateTextField(
                              width: MediaQuery.of(context).size.width * 0.2,
                              controller: _dateOfDiscoveryController,
                              hintText: 'Date of Discovery',
                              onTap: () => _selectDate(context),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Date of Discovery';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              width: MediaQuery.of(context).size.width * 0.2,
                              controller: _possibleCasualtiesController,
                              hintText: 'Possible Casualties',

                              keyboardType: TextInputType.number, // Set the keyboard type
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // Allow only digits
                              ],

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Possible Casualties';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Button color
                            foregroundColor: Colors.white, // Text color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildDateTextField({
    required TextEditingController controller,
    required String hintText,
    required VoidCallback onTap,
    required String? Function(String?) validator,
    double width = double.infinity,
  }) {
    return SizedBox(
      width: width,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: TextFormField(
          controller: controller,

          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
            ),
          ),
          validator: validator,
          readOnly: true, // Prevents manual editing
          onTap: onTap, // Opens the date picker
        ),
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    double width = double.infinity,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength, // Add this parameter
  })
  {
    return SizedBox(
      width: width,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
            ),
            counterText: "", // Hide the default counter text
          ),
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength, // Use the provided maxLength
          maxLengthEnforcement: MaxLengthEnforcement.enforced, // Enforce the limit
        ),
      ),
    );
  }}