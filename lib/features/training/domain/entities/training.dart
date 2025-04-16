class Training {
  final String categoryName;
  final String eventName;
  final List<SlotGroups> slotGroups;

  Training({
    required this.categoryName,
    required this.eventName,
    required this.slotGroups,
  });
}

class SlotGroups {
  final String slotGroupName;
  final List<User> resources;

  SlotGroups({required this.slotGroupName, required this.resources});
}

class User {
  final String firstName;
  final String name;
  final String userId;
  final String photo;
  List<String> certificates;

  User({
    required this.firstName,
    required this.name,
    required this.userId,
    required this.photo,
    required this.certificates,
  });
}
