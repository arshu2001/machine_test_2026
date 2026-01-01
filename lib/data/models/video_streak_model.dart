// Video Models
class VideoResponse {
  final List<VideoItem>? videos;

  VideoResponse({this.videos});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    
    if (json['videos'] != null && json['videos'] is Map) {
      final inner = json['videos'];
      if (inner['videos'] != null) {
        return VideoResponse(
          videos: (inner['videos'] as List).map((i) => VideoItem.fromJson(i)).toList(),
        );
      }
    }
    return VideoResponse(videos: []);
  }
}

class VideoItem {
  final int? id;
  final String? title;
  final String? description;
  final String? url;
  final bool? isCompleted;
  final bool? hasPlayButton;
  final bool? isLocked;

  VideoItem({
    this.id,
    this.title,
    this.description,
    this.url,
    this.isCompleted,
    this.hasPlayButton,
    this.isLocked,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['video_url'], // ✅ CORRECT KEY
      isCompleted: json['status'] == 'completed',
      hasPlayButton: json['has_play_button'],
      isLocked: json['status'] != 'completed',
    );
  }
}


// Streak Models
class StreakResponse {
  final int? currentStreak;
  final List<StreakDay>? days;

  StreakResponse({this.currentStreak, this.days});

  factory StreakResponse.fromJson(Map<String, dynamic> json) {
    
    
    return StreakResponse(
      currentStreak: int.tryParse(json['current_day']?.toString() ?? '0'), 
      days: json['days'] != null 
          ? (json['days'] as List).map((i) => StreakDay.fromJson(i)).toList() 
          : [],
    );
  }
}

class StreakDay {
  final String? day;
  final int? dayNumber;
  final bool? isCompleted;

  StreakDay({this.day, this.dayNumber, this.isCompleted});

  factory StreakDay.fromJson(Map<String, dynamic> json) {
    return StreakDay(
      day: json['label'], // "Day 1"
      dayNumber: json['day_number'], // Direct int from JSON
      isCompleted: json['is_completed'] == true || json['is_completed'] == 'true',
    );
  }
}
