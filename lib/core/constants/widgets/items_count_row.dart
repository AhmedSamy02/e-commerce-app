import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/core/constants/colors.dart';

class ItemsCountRow extends StatefulWidget {
  const ItemsCountRow(
      {super.key, required this.controller, this.maxNumber, this.onChanged});
  final TextEditingController controller;
  final int? maxNumber;
  final void Function(String value)? onChanged;
  @override
  State<ItemsCountRow> createState() => _ItemsCountRowState();
}

class _ItemsCountRowState extends State<ItemsCountRow> {
  int maxNumber = 100;
  @override
  void didChangeDependencies() {
    if (widget.maxNumber != null) {
      maxNumber = widget.maxNumber!;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Colors.black45,
            size: 25.sp,
          ),
          onPressed: () {
            int currNum = int.parse(widget.controller.text);
            if (currNum > 1) {
              widget.controller.text = (currNum - 1).toString();
              setState(() {});
            }
          },
        ),
        SizedBox(
          width: 25.w,
          height: 32.h,
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0), border: InputBorder.none),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: 25.sp,
            color: kMainGreen,
          ),
          onPressed: () {
            int currNum = int.parse(widget.controller.text);
            if (currNum < maxNumber) {
              widget.controller.text = (currNum + 1).toString();
            }
            setState(() {});
          },
        ),
      ],
    );
  }
}
