import 'package:rakta_admin/models/MyFiles.dart';
import 'package:rakta_admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FileInfoCard(info: demoMyFiles[0]);
  }
}


