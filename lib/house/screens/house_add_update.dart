import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labjobfeature/house/house.dart';
import 'package:labjobfeature/house/screens/house_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labjobfeature/models/constants.dart';

class AddUpdateHouse extends StatefulWidget {
  static const routeName = 'houseAddUpdate';
  final HouseArgument args;

  AddUpdateHouse({this.args});

  @override
  _AddUpdateHouseState createState() => _AddUpdateHouseState();
}

class _AddUpdateHouseState extends State<AddUpdateHouse> {
  File _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _house = {};

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          '${widget.args.edit ? "Edit House" : "Add New House"}',
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '${widget.args.edit ? "Edit House" : "Create House"}',style: Theme.of(context).textTheme.headline1.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.title : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'title', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["title"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue: widget.args.edit
                                ? "${widget.args.house.bedrooms}"
                                : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house bedrooms';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'bedrooms', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["bedrooms"] = int.parse(value);
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue: widget.args.edit
                                ? "${widget.args.house.bathrooms}"
                                : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house bathrooms';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'bathrooms', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["bathrooms"] = int.parse(value);
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.cost : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house cost';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'cost',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              setState(() {
                                this._house["cost"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.street : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter street';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'street', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["street"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.city : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house city';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'city', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["city"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.location : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house location';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'location', border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["location"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            initialValue:
                                widget.args.edit ? widget.args.house.category : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house category';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'category',
                              border: OutlineInputBorder(),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.red),
//                        ),
                            ),
                            onSaved: (value) {
                              setState(() {
                                this._house["category"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Theme.of(context).accentColor,
                            minLines:
                                3, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            initialValue:
                                widget.args.edit ? widget.args.house.description : '',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter house description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'description',
                                border: OutlineInputBorder()),
                            onSaved: (value) {
                              setState(() {
                                this._house["description"] = value;
                              });
                            }),
                        SizedBox(
                          height: 20,
                        ),
//                        Row(
//                          children: [
                            Container(

//                              alignment: Align,
//                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor.withAlpha(100)
                              ),
                              child: IconButton(
                                  icon: Icon(Icons.add_a_photo,color: Colors.white,),
                                  onPressed: () async {
                                    await getImage();

                                    this._house["asset"] = _image;
                                  }),
                            ),
//                            Text('${_image == null ? "No image selected." : ""}')
//                          ],
//                        ),
                        Container(

                          child:widget.args.edit && _image == null? Container(
                              height: 100, width: 100, child: Image.network(
                            'http://$Host/assets/attachedfiles/${widget.args.house.asset}',
                          )): _image == null
                              ? Text('No image selected.')
                              : Container(
                                  height: 100, width: 100, child: Image.file(_image)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                final HouseEvent event = widget.args.edit
                                    ? HouseUpdate(
                                  House(
                                      id: widget.args.house.id,
                                      title: this._house["title"],
                                      bedrooms: this._house["bedrooms"],
                                      bathrooms: this._house["bathrooms"],
                                      category: this._house["category"],
                                      status: this._house["status"],
                                      cost: this._house["cost"],
                                      street: this._house["street"],
                                      city: this._house["city"],
                                      location: this._house["location"],
                                      description: this._house["description"],
//                                            userId: this._house["userId"],
                                      asset: this._house["asset"]),
                                )
                                    : HouseCreate(
                                  House(
                                      title: this._house["title"],
                                      bedrooms: this._house["bedrooms"],
                                      bathrooms: this._house["bathrooms"],
                                      category: this._house["category"],
                                      status: this._house["status"],
                                      cost: this._house["cost"],
                                      street: this._house["street"],
                                      city: this._house["city"],
                                      location: this._house["location"],
                                      description: this._house["description"],
//                                            userId: this._house["userId"],
                                      asset: this._house["asset"]),
                                );

                                BlocProvider.of<HouseBloc>(context).add(event);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    HouseList.routeName, (route) => false);
                              }
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [Theme.of(context).accentColor, Theme.of(context).accentColor.withAlpha(140)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(vertical: 16.0),
//                          child: ElevatedButton.icon(
//                            style: ElevatedButton.styleFrom(
//                              primary: Theme.of(context).accentColor,
//                              onPrimary: Colors.white,
//                              elevation: 5,
//                              shadowColor: Theme.of(context).primaryColor,
////                        padding: EdgeInsets.only(top: 10,bottom: 10,right: 80,left: 80),
//                            ),
//                            onPressed: () {
//
//                            },
//                            label: Text('SAVE'),
//                            icon: Icon(Icons.save),
//                          ),
//                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
