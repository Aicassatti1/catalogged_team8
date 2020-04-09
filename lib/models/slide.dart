import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/411.gif',
    title: 'Welcome to Catalogged',
    description: 'Start Organizing Your Paper Receipts',
  ),
  Slide(
    imageUrl: 'assets/images/phone.gif',
    title: 'Organize all paper receipts in one place!',
    description:
        'Introducing a more efficient, paperless way to organize all your expenses',
  ),
  Slide(
    imageUrl: 'assets/images/calendar.gif',
    title: 'Set up Return reminders',
    description:
        'Access by date or by location and never miss a return date after misplacing a receipt',
  ),
];
