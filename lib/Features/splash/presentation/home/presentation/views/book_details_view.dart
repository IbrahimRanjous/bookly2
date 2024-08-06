import 'package:bookly/Features/splash/presentation/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BoookDetailsView extends StatelessWidget {
  const BoookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailsViewBody(),
    );
  }
}