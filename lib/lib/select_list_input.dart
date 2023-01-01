part of '../select_list_input.dart';

class SelectListInput extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final Function() onTap;
  const SelectListInput(
      {super.key,
      required this.controller,
      required this.onTap,
      this.labelText});

  @override
  State<SelectListInput> createState() => _SelectListInputState();
}

class _SelectListInputState extends State<SelectListInput> {
  TextEditingController get controller => widget.controller;
  String? get labelText => widget.labelText;
  Function() get onTap => widget.onTap;

  IconButton get downIcon =>
      IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_drop_down));
  // const Icon(Icons.arrow_drop_down);

  IconButton get clearButton =>
      IconButton(onPressed: _onPressedClearIcon, icon: const Icon(Icons.clear));

  void _onPressedClearIcon() {
    setState(() {
      controller.clear();
    });
  }

  Widget get _getSuffixIcon {
    if (controller.text.isEmpty) return downIcon;
    return clearButton;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: _getSuffixIcon,
      ),
    );
  }
}
