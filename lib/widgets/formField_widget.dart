import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final void Function(String)? onChanged;
  const FormFieldWidget(
      {Key? key, this.controller, this.labelText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$labelText",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            TextField(
              cursorRadius: Radius.zero,
              maxLines: 1,
              controller: controller,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isDense: true,
                suffix: Text(
                  '€',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
