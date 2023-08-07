import 'package:prayer/models/page_model.dart';
import 'package:quran/quran.dart';

class GetSurahInfo {
  PageModel getPage(pageNumber) {
    // ignore: non_constant_identifier_names
    List<String> Page = [];
    String surahText = '';
    List<dynamic> info = getPageData(pageNumber);
    List<String> text = getVersesTextByPage(pageNumber, verseEndSymbol: true);

    int verseCounter = 0;
    for (int i = 0; i < info.length; i++) {
      if (info[i]['start'] == 1) {
        Page.add("سورة ${getSurahNameArabic(info[i]['surah'])}");
        Page.add(basmala);
      }
      for (int j = 0; j < ((info[i]['end']) - (info[i]['start']) + 1); j++) {
        surahText += text[verseCounter];
        verseCounter++;
      }
      Page.add(surahText);
      surahText = '';
    }
    PageModel allPage = PageModel(
        nameOfSurah: getSurahNameArabic(info[0]['surah']),
        juzNumber: getJuzNumber(info[0]['surah'], info[0]['start']),
        pageData: Page);
    return allPage;
  }
}
