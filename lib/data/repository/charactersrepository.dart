import 'package:breakingbadbloc/data/models/characters.dart';
import 'package:breakingbadbloc/data/models/quote.dart';
import 'package:breakingbadbloc/data/web_services/characters_api.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);
  Future<List<Character>> getAllCharacter() async {
    final characters = await charactersApi.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
  Future<List<Qoute>> getQuotes(String charName) async {
    final quotes = await charactersApi.getQuotes(charName);
    return quotes.map((charQuotes) => Qoute.fromJson(charQuotes)).toList();
  }
}
