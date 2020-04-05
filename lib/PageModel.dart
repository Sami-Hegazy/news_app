import 'package:flutter/material.dart';

class PageModel {

  String _title;
  String _description;
  IconData _icons;
  String _images;

  PageModel(this._title, this._description, this._icons, this._images);

  String get images => _images;

  IconData get icons => _icons;

  String get description => _description;

  String get title => _title;


}