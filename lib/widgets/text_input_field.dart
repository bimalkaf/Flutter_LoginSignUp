import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextInputField extends StatefulWidget {
  const MyTextInputField({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  }) : super(key: key);
  final String title;

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  State<MyTextInputField> createState() => _MyTextInputFieldState();
}

class _MyTextInputFieldState extends State<MyTextInputField> {
  late bool obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).unselectedWidgetColor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: obsecureText
                          ? Theme.of(context).unselectedWidgetColor
                          : Theme.of(context).primaryColor,
                    ),
                  )
                : const SizedBox(),
            hintText: widget.hint,
            hintStyle:
                TextStyle(color: Theme.of(context).unselectedWidgetColor),
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          ),
          obscureText: obsecureText,
        ),
      ],
    );
  }
}
