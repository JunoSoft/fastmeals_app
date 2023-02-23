import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20),);
  }
}