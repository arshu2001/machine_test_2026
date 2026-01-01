class HomeData {
  final UserData? userdata;
  final List<Category>? categories; 
  final List<HeroBanner>? heroBanners;
  final ActiveCourse? activeCourse;
  final Community? community;
  final List<Testimonial>? testimonials;
  final Support? support;

  HomeData({this.userdata, this.categories, this.heroBanners, this.activeCourse, this.community, this.testimonials, this.support});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      userdata: json['user'] != null ? UserData.fromJson(json['user']) : null,
      categories: json['popular_courses'] != null 
          ? (json['popular_courses'] as List).map((i) => Category.fromJson(i)).toList() 
          : [],
      heroBanners: json['hero_banners'] != null
          ? (json['hero_banners'] as List).map((i) => HeroBanner.fromJson(i)).toList()
          : [],
      activeCourse: json['active_course'] != null ? ActiveCourse.fromJson(json['active_course']) : null,
      community: json['community'] != null ? Community.fromJson(json['community']) : null,
      testimonials: json['testimonials'] != null 
          ? (json['testimonials'] as List).map((i) => Testimonial.fromJson(i)).toList() 
          : [],
      support: json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }
}

class UserData {
  final String? name;
  final String? greeting;
  final int? streakDays;
  final String? streakIcon;

  UserData({
    this.name,
    this.greeting,
    this.streakDays,
    this.streakIcon,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      greeting: json['greeting'],
      streakDays: json['streak']?['days'],
      streakIcon: json['streak']?['icon'],
    );
  }
}


class HeroBanner {
  final int? id;
  final String? title;
  final String? image;
  final bool? isActive;

  HeroBanner({this.id, this.title, this.image, this.isActive});

  factory HeroBanner.fromJson(Map<String, dynamic> json) {
    return HeroBanner(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      isActive: json['is_active'] == true,
    );
  }
}

class Course {
  final int? id;
  final String? title;
  final String? image; 

  Course({this.id, this.title, this.image});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class Category {
  final int? id;
  final String? name;
  final List<Course>? courses;

  Category({this.id, this.name, this.courses});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      courses: json['courses'] != null 
          ? (json['courses'] as List).map((i) => Course.fromJson(i)).toList() 
          : [],
    );
  }
}

class ActiveCourse {
  final String? title;
  final int? progress;

  ActiveCourse({this.title, this.progress});

  factory ActiveCourse.fromJson(Map<String, dynamic> json) {
    return ActiveCourse(
      title: json['title'],
      progress: json['progress'],
    );
  }
}

class Community {
  final String? name;
  final int? activeMembers;
  final String? description;
  final String? action;
  final RecentActivity? recentActivity;

  Community({this.name, this.activeMembers, this.description, this.action, this.recentActivity});

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      name: json['name'],
      activeMembers: json['active_members'],
      description: json['description'],
      action: json['action'],
      recentActivity: json['recent_activity'] != null ? RecentActivity.fromJson(json['recent_activity']) : null,
    );
  }
}

class RecentActivity {
  final String? status;
  final List<RecentMember>? recentMembers;

  RecentActivity({this.status, this.recentMembers});

  factory RecentActivity.fromJson(Map<String, dynamic> json) {
    return RecentActivity(
      status: json['status'],
      recentMembers: json['recent_members'] != null 
          ? (json['recent_members'] as List).map((i) => RecentMember.fromJson(i)).toList() 
          : [],
    );
  }
}

class RecentMember {
  final int? id;
  final String? avatar;

  RecentMember({this.id, this.avatar});

  factory RecentMember.fromJson(Map<String, dynamic> json) {
    return RecentMember(
      id: json['id'],
      avatar: json['avatar'],
    );
  }
}

class Testimonial {
  final int? id;
  final TestimonialLearner? learner;
  final String? review;
  final bool? isActive;

  Testimonial({this.id, this.learner, this.review, this.isActive});

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      id: json['id'],
      learner: json['learner'] != null ? TestimonialLearner.fromJson(json['learner']) : null,
      review: json['review'],
      isActive: json['is_active'] == true,
    );
  }
}

class TestimonialLearner {
  final String? name;
  final String? avatar;

  TestimonialLearner({this.name, this.avatar});

  factory TestimonialLearner.fromJson(Map<String, dynamic> json) {
    return TestimonialLearner(
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}

class Support {
  final String? title;
  final String? description;
  final String? exampleQuestion;
  final String? illustration;
  final List<SupportAction>? actions;

  Support({this.title, this.description, this.exampleQuestion, this.illustration, this.actions});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      title: json['title'],
      description: json['description'],
      exampleQuestion: json['example_question'],
      illustration: json['illustration'],
      actions: json['actions'] != null 
          ? (json['actions'] as List).map((i) => SupportAction.fromJson(i)).toList() 
          : [],
    );
  }
}

class SupportAction {
  final String? type;
  final String? label;
  final String? icon;

  SupportAction({this.type, this.label, this.icon});

  factory SupportAction.fromJson(Map<String, dynamic> json) {
    return SupportAction(
      type: json['type'],
      label: json['label'],
      icon: json['icon'],
    );
  }
}
