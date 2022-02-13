import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:breakingbadbloc/data/models/quote.dart';
import 'package:breakingbadbloc/data/repository/charactersrepository.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacter().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
  void getQuotes(String charName) {
    charactersRepository.getQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
