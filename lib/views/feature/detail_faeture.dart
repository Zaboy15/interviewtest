import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';

class DetailFeature extends StatefulWidget {
  final dynamic data;
  const DetailFeature({super.key, this.data});

  @override
  State<DetailFeature> createState() => _DetailFeatureState();
}

class _DetailFeatureState extends State<DetailFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cPrimary,
        title: Text("Detail Univ"),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.data['name']),
            Text(widget.data['country']),
          ],
        ),
      ),
    );
  }
}
