import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

Widget buildSectionTitle(String title) {
    return CustomText(
      text: title,
      fontSize: 18.spMin,
      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
    );
  }