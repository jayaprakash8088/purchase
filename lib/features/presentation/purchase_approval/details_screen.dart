import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/app_providers/detail_provider.dart';
import 'package:purchase_approval/features/utils/text_style.dart';

import '../../utils/my_strings.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var detailProvider = Provider.of<DetailProvider>(context);
    detailProvider.isLoaded?null:
    detailProvider.callRequest();
    return Scaffold(
        body: !detailProvider.isLoaded
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns:  [
                DataColumn(
                  label: Text(unit,style: pinkText,),
                ),
                DataColumn(
                  label: Text(min,style: pinkText),
                ),
                DataColumn(
                  label: Text(supplier,style: pinkText),
                ),
                DataColumn(
                  label: Text(date,style: pinkText),
                ),
                DataColumn(
                  label: Text(max,style: pinkText),
                ),
                DataColumn(
                  label: Text(supplier,style: pinkText),
                ),
                DataColumn(
                  label: Text(date,style: pinkText),
                ),
              ], rows: detailProvider.response.table.map((e) =>  DataRow(cells: [
                DataCell(Text(e.a)),
                DataCell(Text(e.b.toString())),
                DataCell(Text(e.c)),
                DataCell(Text(e.d)),
                DataCell(Text(e.e.toString())),
                DataCell(Text(e.f)),
                DataCell(Text(e.g)),
              ])).toList()

              )
              ),
            ),
    );
  }
}
