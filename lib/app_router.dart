import 'package:breakingbadbloc/constants/string.dart';
import 'package:breakingbadbloc/data/repository/charactersrepository.dart';
import 'package:breakingbadbloc/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbadbloc/presentation/screens/characters_detelse.dart';
import 'package:breakingbadbloc/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/characters.dart';
import 'data/web_services/characters_api.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateroute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetelseScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => BlocProvider(
              create:
                  (BuildContext context) => charactersCubit,
                child: CharactersDetelseScreen(character: character)));
    }
  }
}
