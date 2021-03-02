import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labjobfeature/house/bloc/bloc.dart';
import 'package:labjobfeature/house/house.dart';
import 'package:labjobfeature/models/constants.dart';

class HouseList extends StatefulWidget {
  static const routeName = '/';

  @override
  _HouseListState createState() => _HouseListState();
}
  class _HouseListState extends State<HouseList>{
  @override
  Widget build(BuildContext context) {
    //header section
    Widget titleSection = Container(
      padding: const EdgeInsets.only(top: 60, bottom: 24, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Hello John,',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Text('Find Your New Home',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'images/liben.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );

    //    input section
    Widget inputSection = Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(left: 20, top: 8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey[350],
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(5.0, 5.0),
        )
      ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: TextField(
        showCursor: true,
        readOnly: true,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              size: 28.0,
//              color: Theme.of(context).primaryColor,
            ),
            border: InputBorder.none,
            hintText: 'where do you want to live?'),
        onTap: () {
          showSearch(context: context, delegate: DataSearch());
        },
      ),
    );

//    suggestion builder function
    Container _suggestionBuilder(String imgPath, String label) {
      return Container(
        margin: EdgeInsets.only(right: 20),
        height: 132,
        width: 100,
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            height: 122,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(5.0, 5.0),
                  )
                ]),
            width: 120,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: Image.asset(
                    imgPath,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.bodyText1,
                    ))
              ],
            ),
          ),
        ),
      );
    }

    //    suggestion section
    Widget suggestionSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              'What are you looking for?',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            height: 152,
            padding: EdgeInsets.only(left: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    _suggestionBuilder('images/liben.jfif', 'Houses'),
                    _suggestionBuilder('images/liben.jfif', 'Apartments'),
                    _suggestionBuilder('images/liben.jfif', 'Condos')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

//    nearyoubuilder
    Container nearYouBuilder(String imgPath, String item, String city) {
      return Container(
        height: 160,
        width: 160,
        margin: EdgeInsets.only(right: 15),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 12, bottom: 6),
                  child:
                      Text(item, style: Theme.of(context).textTheme.headline4)),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                    size: 17,
                  ),
                  Text(city, style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            ],
          ),
        ),
      );
    }

//nearyousection
    Widget nearYouSection = Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Popular near you',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Text(
                'view all',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 160,
          padding: EdgeInsets.only(left: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  nearYouBuilder('images/liben.jfif', 'Studio Apartment',
                      'Los Angeles, CA'),
                  nearYouBuilder('images/liben.jfif', '3B Condo', 'Encino, CA'),
                  nearYouBuilder(
                      'images/liben.jfif', '2B Condo', 'Los Angeles, CA'),
                ],
              ),
            ],
          ),
        ),
      ],
    );

//    recent searches builder
    Container _recentSearchesBuilder(String imgPath, String item, String city) {
      return Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.only(right: 15),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 12, bottom: 6),
                  child:
                      Text(item, style: Theme.of(context).textTheme.headline4)),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                    size: 17,
                  ),
                  Text(city, style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            ],
          ),
        ),
      );
    }

//    suggestion section
    Widget _recentSearchesSection = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              'Recent Searches',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(left: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    _recentSearchesBuilder('images/liben.jfif',
                        'Studio Apartment', 'Los Angeles, CA'),
                    _recentSearchesBuilder(
                        'images/liben.jfif', '3B Condo', 'Encino, CA'),
                    _recentSearchesBuilder(
                        'images/liben.jfif', '2B Condo', 'Los Angeles, CA')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    ListView _houseBuilder(houses) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
//        physics: ScrollPhysics(),
        itemCount: houses.length,
        itemBuilder: (_, idx) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, HouseDetail.routeName,
              arguments: houses[idx]),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: 20, top: 20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(
                    'http://$Host/assets/attachedfiles/${houses[idx].asset}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 2),
                            width: 180,
//                            child: Flexible(
                            child: Text(
                              '${houses[idx].title}',
                              style: Theme.of(context).textTheme.headline3,
                            ),
//                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'images/bed.svg',
                                      width: 26,
                                      color: Colors.grey[600],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          '${houses[idx].bedrooms} Beds',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'images/bath.svg',
                                    width: 26,
                                    color: Colors.grey[600],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '${houses[idx].bathrooms} Baths',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
//                              child: Flexible(
                            child: Text(
                              '${houses[idx].street}, ${houses[idx].city}, ${houses[idx].location}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
//                              ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              '\$${houses[idx].cost}',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async => BlocProvider.of<HouseBloc>(context).add(HouseLoad()),
        child: BlocBuilder<HouseBloc, HouseState>(
          builder: (_, state) {
            if (state is HouseOperationFailure) {
              return Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/not_found.svg',
                        height: 200,
                      ),
                      Text('Could not do House operation')
                    ],
                  ));
            }

            if (state is HousesLoadSuccess) {
              final houses = state.houses;

              return ListView(
                children: <Widget>[
                  titleSection,
                  inputSection,
                  suggestionSection,
                  nearYouSection,
                  _recentSearchesSection,
                  _houseBuilder(houses),
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}


class DataSearch extends SearchDelegate<String> {
  List<House> houses = [];

  Set<String> recentHouses = {};

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return  BlocBuilder<HouseBloc, HouseState>(
        builder: (_, state) {
          if (state is HouseOperationFailure) {
            return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/not_found.svg',
                      height: 200,
                    ),
                    Text('Could not do search operation')
                  ],
                ));
          }

          if (state is HousesLoadSuccess) {
            final houses = state.houses.where((house) => house.city == query);
            return ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//        physics: ScrollPhysics(),
              itemCount: houses.length,
              itemBuilder: (_, idx) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, HouseDetail.routeName,
                    arguments: houses.elementAt(idx)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                          'http://$Host/assets/attachedfiles/${houses.elementAt(idx).asset}',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 2),
                                  width: 180,
//                             child: Flexible(
                                  child: Text(
                                    '${houses.elementAt(idx).title}',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
//                             ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/bed.svg',
                                            width: 26,
                                            color: Colors.grey[600],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                '${houses.elementAt(idx).bedrooms} Beds',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/bath.svg',
                                          width: 26,
                                          color: Colors.grey[600],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              '${houses.elementAt(idx).bathrooms} Baths',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
//                                child: Flexible(
                                    child: Text(
                                      '${houses.elementAt(idx).street}, ${houses.elementAt(idx).city}, ${houses.elementAt(idx).location}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
//                                ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Center(
                                  child: Text(
                                    '\$${houses.elementAt(idx).cost}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<HouseBloc, HouseState>(builder: (context, houseState) {
      if (houseState is HouseOperationFailure) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/not_found.svg',
                height: 200,
              ),
              Text('Could not do search operation')
            ],
          ),
        );
      }
      if (houseState is HousesLoadSuccess) {
        for (var house in houseState.houses) {
          recentHouses.add(house.city);
        }
        houses = houseState.houses;
        final suggestionList = query.isEmpty
            ? recentHouses
            : recentHouses.where((p) => p.startsWith(query));

        if (suggestionList.isEmpty) {
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/not_found.svg',
                  height: 200,
                ),
                Text('no results found')
              ],
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
                query = recentHouses.elementAt(index);
              },
              leading: Icon(Icons.location_city),
              title: RichText(
                text: TextSpan(
                    text: suggestionList
                        .elementAt(index)
                        .substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList
                              .elementAt(index)
                              .substring(query.length),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor))
                    ]),
              )),
          itemCount: suggestionList.length,
        );
      }
    });
  }
}
