import 'package:flutter/material.dart';

class VehicleRequirementScreen extends StatelessWidget {
  const VehicleRequirementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Vehicle requirement',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField('Brand', 'Select Brand'),
            const SizedBox(height: 16),
            _buildDropdownField('Model', 'Select Model'),
            const SizedBox(height: 16),
            _buildDropdownField('Variant', 'Select Variant'),
            const SizedBox(height: 16),
            _buildDropdownField('Year', 'Select Year'),
            const SizedBox(height: 16),
            const Text(
              'Transmission *',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildRadioButton('Automatic', true),
                const SizedBox(width: 16),
                _buildRadioButton('Manual', false),
              ],
            ),
            const SizedBox(height: 16),
            _buildDropdownField('Fuel', 'Select fuel type'),
            const SizedBox(height: 16),
            _buildDropdownField('Color', 'Select Color'),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  backgroundColor: Color(0xFF4A101D),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            value: null,
            hint: Text(hint, style: TextStyle(color: Colors.grey.shade600)),
            items: [],
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton(String label, bool selected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 179,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
              color: selected ? Color(0xFF4A101D) : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: selected ? Color(0xFF4A101D).withOpacity(0.1) : Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: selected ? Color(0xFF4A101D) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
