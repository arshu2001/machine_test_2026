import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_2026/data/models/home_model.dart';
import 'package:machine_test_2026/widgets/custom_text.dart';

class TestimonialSection extends StatefulWidget {
  final List<Testimonial> testimonials;
  const TestimonialSection({super.key, required this.testimonials});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.testimonials.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = widget.testimonials[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                   boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10.r, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  children: [
                    // Top Teal Section
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00B7C2), // Teal
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundImage: item.learner?.avatar != null 
                              ? NetworkImage(item.learner!.avatar!) 
                              : null,
                            backgroundColor: Colors.white24,
                            child: item.learner?.avatar == null ? const Icon(Icons.person, color: Colors.white) : null,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: item.learner?.name ?? "Learner",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.spMin,
                                  fontColor: Colors.white,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 16.spMin),
                                    Icon(Icons.star, color: Colors.amber, size: 16.spMin),
                                    Icon(Icons.star, color: Colors.amber, size: 16.spMin),
                                    Icon(Icons.star, color: Colors.amber, size: 16.spMin),
                                    Icon(Icons.star_half, color: Colors.amber, size: 16.spMin),
                                    SizedBox(width: 4.w),
                                    CustomText(
                                      text: "4.5",
                                      fontColor: Colors.white,
                                      fontSize: 12.spMin,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Bottom White Section (Review)
                    Expanded(
                      child: Container(
                         width: double.infinity,
                         padding: EdgeInsets.all(16.r),
                         decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FA), // Very light grey/white
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
                         ),
                        child: Center(
                          child: CustomText(
                            text: item.review ?? "This course was amazing!",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            fontColor: Colors.grey[700],
                            fontSize: 14.spMin,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        
        // Pagination Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.testimonials.length, (index) {
             return AnimatedContainer(
               duration: const Duration(milliseconds: 300),
               margin: EdgeInsets.symmetric(horizontal: 4.w),
               height: 8.h,
               width: _currentIndex == index ? 24.w : 8.w,
               decoration: BoxDecoration(
                 color: _currentIndex == index ? const Color(0xFF00B7C2) : Colors.grey.shade300,
                 borderRadius: BorderRadius.circular(4.r),
               ),
             );
          }),
        )
      ],
    );
  }
}