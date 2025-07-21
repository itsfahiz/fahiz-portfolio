import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/acheivement_model.dart';
import '../../../view model/getx_controllers/achievemnet_controller.dart';
import '../../res/constants.dart';

class AchievementList extends StatelessWidget {
  final controller = Get.find<AchievementController>();

  AchievementList({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return ListView.builder(
      itemCount: achievementList.length,
      itemBuilder: (context, index) {
        final achievement = achievementList[index];

        return AnimatedContainer(
          duration: 300.milliseconds,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Icon + Date Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    width: isMobile ? 60 : 100,
                    height: isMobile ? 60 : 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(achievement.iconAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  // Text Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          achievement.title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${achievement.organization} • ${achievement.date}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          achievement.description,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Client image or fallback icon
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        achievement.clientImage.isNotEmpty
                            ? AssetImage(achievement.clientImage)
                            : null,
                    child:
                        achievement.clientImage.isEmpty
                            ? Text(
                              achievement.organization.isNotEmpty
                                  ? achievement.organization[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            : null,
                  ),

                  const SizedBox(width: 12),
                  Icon(Icons.format_quote, color: Colors.blueAccent),
                  const SizedBox(width: 8),
                  // ✅ Client message
                  Expanded(
                    child: Text(
                      achievement.clientMessage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
