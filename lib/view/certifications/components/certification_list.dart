import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';

class CertificateList extends StatefulWidget {
  const CertificateList({super.key});

  @override
  _CertificateListState createState() => _CertificateListState();
}

class _CertificateListState extends State<CertificateList> {
  final Set<int> _expandedIndexes = {};

  bool _isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = _isLargeScreen(context);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: certificateList.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemBuilder: (context, index) {
        final cert = certificateList[index];
        final isExpanded = isLargeScreen || _expandedIndexes.contains(index);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade900,
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: isLargeScreen ? 120 : 80, // Increased height on web
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child:
                        cert.logoAsset.isNotEmpty
                            ? Image.asset(cert.logoAsset, fit: BoxFit.contain)
                            : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                  colors: [primaryColor, secondaryColor],
                                ),
                              ),
                              child: const Icon(
                                Icons.school,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cert.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      cert.organization,
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      cert.date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    if (isExpanded) ...[
                      const SizedBox(height: 6),
                      Text(
                        'Credential ID: ${cert.credentialId}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Skills: ${cert.skills}',
                        style: TextStyle(color: Colors.grey[300], fontSize: 13),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        cert.description,
                        style: TextStyle(color: Colors.grey[300], fontSize: 13),
                      ),
                    ],
                  ],
                ),
              ),

              if (!isLargeScreen) ...[
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.open_in_new,
                        color: Colors.lightBlue,
                      ),
                      tooltip: 'View Credential',
                      onPressed: () => _launchCredential(cert.credentialUrl),
                    ),
                    IconButton(
                      icon: Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.grey,
                      ),
                      tooltip: isExpanded ? 'Collapse' : 'Expand',
                      onPressed: () {
                        setState(() {
                          if (isExpanded) {
                            _expandedIndexes.remove(index);
                          } else {
                            _expandedIndexes.add(index);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ] else ...[
                // On large screen, only show the link icon
                IconButton(
                  icon: const Icon(Icons.open_in_new, color: secondaryColor),
                  tooltip: 'View Credential',
                  onPressed: () => _launchCredential(cert.credentialUrl),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  void _launchCredential(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Could not open credential link");
    }
  }
}
