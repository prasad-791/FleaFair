import 'package:flutter/material.dart';

//ignore: must_be_immutable
class TextFieldSuffixIcon extends StatefulWidget {

  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? label;
  final String? hint;
  final String? errorText;
  final double radius;
  final Color? accent;
  final TextInputType inputType;
  bool obscure;
  final ValueChanged<String>? onSaved;

  TextFieldSuffixIcon({Key? key,
    required this.suffixIcon, required this.prefixIcon, required this.label, required this.hint,
    required this.errorText, this.radius=8, required this.accent, required this.inputType,
    required this.obscure, required this.onSaved}) : super(key: key);

  @override
  _TextFieldSuffixIconState createState() => _TextFieldSuffixIconState();
}

class _TextFieldSuffixIconState extends State<TextFieldSuffixIcon> {

  void _toggle(){
    setState((){
      widget.obscure = !widget.obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: widget.inputType,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          labelText: widget.label,
          labelStyle: TextStyle(
              color: Colors.grey
          ),
          hintText: widget.hint,
          suffixIcon: GestureDetector(
            onTap: _toggle,
            child: Icon(
              widget.obscure ? widget.suffixIcon : Icons.visibility_off ,
              color: widget.accent,
              size: 20,
            ),
          ),
          alignLabelWithHint: true,
          prefixIcon: Icon(widget.prefixIcon,color: widget.accent,size: 20,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.accent!.withOpacity(.2)),
            gapPadding: 16,
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.accent!.withOpacity(.3)),
            gapPadding: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.accent!.withOpacity(.8)),
            gapPadding: 16,
          ),
        ),
        onSaved: (value)=> widget.onSaved!(value!),
        validator: (value){
          if(value!.isEmpty) return widget.errorText;
          return null;
        },
      ),
    );
  }
}