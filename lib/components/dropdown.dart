import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String dropdownValue;
  final List<String> dropdownOptions;
  final void Function(String) onChange;
  final String hint;

  Dropdown({
    @required this.dropdownValue,
    @required this.onChange,
    @required this.dropdownOptions,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: dropdownValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      hint: Text(hint),
      isDense: true,
      icon: Icon(Icons.keyboard_arrow_down),
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Selecione uma opção';
        }
        return null;
      },
      items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
