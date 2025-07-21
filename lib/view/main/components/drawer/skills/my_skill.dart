import 'package:flutter/material.dart';
import 'skill_item.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        SkillItem(title: 'Flutter', image: 'assets/icons/flutter.png'),
        SkillItem(title: 'Dart', image: 'assets/icons/dart.png'),
        SkillItem(title: 'Golang', image: 'assets/icons/golang.png'),
        SkillItem(title: 'Node.js', image: 'assets/icons/nodejs.png'),
        SkillItem(title: 'React.js', image: 'assets/icons/nodejs.png'),
        SkillItem(title: 'PostgreSQL', image: 'assets/icons/postgresql.png'),
        SkillItem(title: 'Firebase', image: 'assets/icons/firebase.png'),
        SkillItem(title: 'MongoDB', image: 'assets/icons/mongodb.png'),
        SkillItem(title: 'Git', image: 'assets/icons/git.png'),
        SkillItem(title: 'Postman', image: 'assets/icons/postman.png'),
        SkillItem(title: 'Figma', image: 'assets/icons/figma.png'),
        SkillItem(title: 'Jira', image: 'assets/icons/jira.png'),
        SkillItem(title: 'AWS', image: 'assets/icons/aws.png'),
        SkillItem(title: 'REST API', image: 'assets/icons/api.png'),
        SkillItem(title: 'Provider', image: 'assets/icons/dart.png'),
        SkillItem(title: 'Bloc', image: 'assets/icons/bloc.png'),
        SkillItem(title: 'Riverpod', image: 'assets/icons/riverpod.png'),
      ],
    );
  }
}
