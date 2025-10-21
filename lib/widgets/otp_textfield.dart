import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';

class OtpTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const OtpTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (index) => TextEditingController());
    _focusNodes = List.generate(6, (index) => FocusNode());

    // Initialize controllers with existing value if any
    if (widget.controller.text.isNotEmpty) {
      for (int i = 0; i < widget.controller.text.length; i++) {
        _controllers[i].text = widget.controller.text[i];
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
    _updateControllerValue();
  }

  void _updateControllerValue() {
    final otp = _controllers.map((c) => c.text).join();
    widget.controller.text = otp;
    widget.onChanged?.call(otp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: TextFormField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textFieldBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.inputBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: AppColors.primaryPurple, width: 2),
                ),
                counterText: "",
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              onChanged: (value) => _onChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}
