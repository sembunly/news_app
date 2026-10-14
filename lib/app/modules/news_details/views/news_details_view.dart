import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text('news_details'.tr), centerTitle: true),
      body: Obx(() {
        final article = controller.article.value;

        if (article == null) {
          return Center(child: Text('no_news_details'.tr));
        }

        return ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            if (article.image != null && article.image!.isNotEmpty)
              Image.network(
                article.image!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildImagePlaceholder(colorScheme),
              )
            else
              _buildImagePlaceholder(colorScheme),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.source?.name?.isNotEmpty == true)
                    Text(
                      article.source!.name!,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    article.title ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  if (article.publishedAt?.isNotEmpty == true) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 17,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            article.publishedAt!,
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (article.description?.isNotEmpty == true) ...[
                    const SizedBox(height: 20),
                    Text(
                      article.description!,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(height: 1.5),
                    ),
                  ],
                  if (article.content?.isNotEmpty == true) ...[
                    const SizedBox(height: 18),
                    Text(
                      article.content!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildImagePlaceholder(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      height: 250,
      color: colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 48,
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
