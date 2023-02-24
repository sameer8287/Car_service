import 'package:flutter/material.dart';
class Roundbtn extends StatelessWidget {
  final bool loading;
  final VoidCallback ontap;
  const Roundbtn({
    Key? key,
    required this.ontap,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: loading ? const CircularProgressIndicator(strokeWidth: 3,color: Colors.white):
        Text('Login'))
      ),
    );
  }
}
