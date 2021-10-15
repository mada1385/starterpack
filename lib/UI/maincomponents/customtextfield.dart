import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:starterpack/core/config/colors.dart';

class CustomTextfield extends StatefulWidget {
  final Widget suffix;
  final IconData priffix;
  final TextEditingController controller;
  final bool isobscure, borderd, enabled;
  final int validator, maxchar, maxlines;
  final Function customvalidator;
  final bool isnumber;
  final String hint, label;
  String data;

  CustomTextfield(
      {Key key,
      this.hint,
      this.label,
      // ignore: avoid_init_to_null
      this.priffix = null,
      // ignore: avoid_init_to_null
      this.suffix = null,
      this.controller,
      this.isobscure = false,
      // ignore: avoid_init_to_null
      this.validator = null,
      // ignore: avoid_init_to_null
      this.customvalidator = null,
      this.borderd = true,
      this.enabled = true,
      this.isnumber = false,
      this.maxchar,
      this.maxlines = 1,
      this.data})
      : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    List<MultiValidator> validators = [
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        EmailValidator(errorText: "this email is not valid")
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        MinLengthValidator(8,
            errorText: 'the password should have atvleast 8 number'),
      ]),
      MultiValidator([
        RequiredValidator(errorText: "this field is required"),
        MinLengthValidator(11,
            errorText: 'the phonenumber should have atleast 11 number'),
      ]),
    ];
    return TextFormField(
        onChanged: (val) {
          setState(() {
            widget.data = val;
          });
        },
        maxLength: widget.maxchar ?? null,
        keyboardType:
            widget.isnumber ? TextInputType.number : TextInputType.name,
        inputFormatters: widget.isnumber
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ]
            : [],
        maxLines: widget.maxlines == null ? null : widget.maxlines,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: widget.isobscure,
        decoration: new InputDecoration(
            counterText: "",
            focusedBorder: widget.borderd == true
                ? OutlineInputBorder(
                    borderSide: new BorderSide(color: maincolor))
                : InputBorder.none,
            border: widget.borderd == true
                ? OutlineInputBorder(
                    borderSide: new BorderSide(color: maincolor))
                : InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: widget.hint,
            // labelText: label,
            // labelStyle: TextStyle(
            //   color: textcolor,
            // ),
            // prefixIcon: Icon(priffix, color: maincolor) ?? null,
            prefixText: '     ',
            suffix: widget.suffix,
            suffixStyle: TextStyle(
              color: maincolor,
            )),
        validator: validators[widget.validator]);
  }
}
