enum AppMode {
  student,
  police,
  army,
  traveler,
  creator,
}

extension AppModeExtension on AppMode {
  String get label {
    switch (this) {
      case AppMode.student:
        return "Student";
      case AppMode.police:
        return "Police";
      case AppMode.army:
        return "Army";
      case AppMode.traveler:
        return "Traveler";
      case AppMode.creator:
        return "Creator";
    }
  }
}
