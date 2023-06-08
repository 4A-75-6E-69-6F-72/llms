import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/components/search_bar.dart';

class SearchBarController extends StatefulWidget {
  String placeholder;
  SearchBarController({required this.placeholder, super.key});

  @override
  State<SearchBarController> createState() => _SearchBarControllerState();
}

class _SearchBarControllerState extends State<SearchBarController> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: widget.placeholder,
    );
  }
}
