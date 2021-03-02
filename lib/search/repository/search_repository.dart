import 'package:meta/meta.dart';
import 'package:labjobfeature/search/data_provider/data_provider.dart';

class SearchRepository{
  final SearchDataProvider dataProvider;
  SearchRepository({@required this.dataProvider}):assert(dataProvider != null);

  Future<List<House>> getHouse(String keyword) async{
    return await dataProvider.getSearch(keyword);
  }
}