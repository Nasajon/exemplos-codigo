import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownMenuString extends StatelessWidget {
  const DropdownMenuString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier('');
    final dropOptions = ['Matheus Mariano', 'Sérgio Silva', 'Wallace Pinho'];

    return ValueListenableBuilder(
      valueListenable: dropValue,
      builder: (BuildContext context, String value, _) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: DropdownButtonFormField2<dynamic>(
                offset: const Offset(0, -20),
                decoration: InputDecoration(
                  label: const Text('Colaborador'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                isExpanded: true,
                value: (value.isEmpty) ? null : value,
                onChanged: (choice) => dropValue.value = choice,
                items: dropOptions
                    .map((op) => DropdownMenuItem(
                          value: op,
                          child: Text(op),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
