class ProjectModel {
  final String title;
  final String content;
  final List<String> languageUsed;
  final String imageUrl;
  final String githubUrl;
  final String? applicationUrl;

  ProjectModel(
      {required this.title,
      required this.content,
      required this.languageUsed,
      required this.imageUrl,
      required this.githubUrl,
      this.applicationUrl});
}
