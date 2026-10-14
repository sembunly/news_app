import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'choose_language': 'Choose Language',
      'english': 'English',
      'khmer': 'Khmer',
      'latest_news': 'Latest News',
      'no_news_found': 'No news found',
      'news_details': 'News Details',
      'news_details_message': 'News details are working',
      'no_news_details': 'News details are unavailable',
    },
    'km': {
      'choose_language': 'ជ្រើសរើសភាសា',
      'english': 'ភាសាអង់គ្លេស',
      'khmer': 'ភាសាខ្មែរ',
      'latest_news': 'ព័ត៌មានថ្មីៗ',
      'no_news_found': 'រកមិនឃើញព័ត៌មាន',
      'news_details': 'ព័ត៌មានលម្អិត',
      'news_details_message': 'ទំព័រព័ត៌មានលម្អិតដំណើរការធម្មតា',
      'no_news_details': 'មិនមានព័ត៌មានលម្អិតទេ',
    },
  };
}
