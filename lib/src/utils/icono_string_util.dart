import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert'         : Icons.add_alert,
  'accessibility'     : Icons.accessibility,
  'folder_open'       : Icons.folder_open,
  'donut_large'       : Icons.donut_large,
  'input'             : Icons.input,
  'toggle_on_outlined': Icons.toggle_on_outlined,
  'list': Icons.list
};

Icon getIcon( String iconName ){
  return Icon(
    _icons[iconName],
    color: Colors.teal,
  );
}
