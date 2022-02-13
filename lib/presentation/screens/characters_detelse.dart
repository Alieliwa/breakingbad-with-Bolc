import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breakingbadbloc/constants/my_colors.dart';
import 'package:breakingbadbloc/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breakingbadbloc/business_logic/cubit/characters_cubit.dart';


class CharactersDetelseScreen extends StatelessWidget {
  final Character character;
  const CharactersDetelseScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.mywhite),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,) ,
        ),
      ),
    );
  }
  Widget characterInfo(String title,String value){
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.mywhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: MyColors.mywhite,
                fontSize: 16,
              ),
            ),
          ],
        )  ,
    );
  }
  Widget buildDivider(double endIndent){
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );

  }
  Widget  checkIfQuotesAreLoaded(CharactersState state){
    if(state is QuotesLoaded){
      return disPlayRandomQuoteOrEmptySpace(state);
    }else{
      return showProgressIndicator();
    }
  }
  Widget disPlayRandomQuoteOrEmptySpace(state){
    var quotes = (state).quotes;
    if(quotes.length != 0){
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: MyColors.mywhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.myYellow,
                offset: Offset(0,0)
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
               FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),) ,
      );
    }else{
      return Container();
    }
  }
  Widget showProgressIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.fromLTRB(14,14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('Job : ', character.jops.join(' / ')),
                    buildDivider(315),
                    characterInfo('Appeard in : ', character.category),
                    buildDivider(250),
                    character.appearance1.isEmpty ? Container():
                    characterInfo('Seasons : ', character.appearance1.join(' / ')),
                    character.appearance1.isEmpty ? Container():
                    buildDivider(270),
                    characterInfo('Status : ', character.status),
                    buildDivider(300),
                    character.CallSaulappearance2.isEmpty ? Container():
                    characterInfo('Beter Call Seasons : ', character.CallSaulappearance2.join(' / ')),
                    character.CallSaulappearance2.isEmpty ? Container():
                    buildDivider(200),
                    characterInfo('Actor/Actress : ', character.actorName),
                    buildDivider(235),
                  ],
                ),
              ),
              BlocBuilder<CharactersCubit,CharactersState>(
                builder: (context,state){
                  return checkIfQuotesAreLoaded(state);
                },
              ),
              SizedBox(
                height: 430,
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
