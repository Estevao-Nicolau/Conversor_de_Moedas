import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox(
      {Key? key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel?) onChanged;
  final CurrencyModel selectedItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          height: 56,
          child: DropdownButton<CurrencyModel>(
            iconEnabledColor: Colors.amber,
            isExpanded: true,
            value: selectedItem,
            underline: Container(
              height: 1,
              color: Colors.purpleAccent,
            ),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onChanged: onChanged,
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.purpleAccent,
              )),
            ),
          ),
        ),
      ],
    );
  }
}
