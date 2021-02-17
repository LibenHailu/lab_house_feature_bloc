import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labjobfeature/house/house.dart';
import 'package:labjobfeature/house/screens/house_list.dart';

class AddUpdateHouse extends StatefulWidget {
  static const routeName = 'houseAddUpdate';
  final HouseArgument args;

  AddUpdateHouse({this.args});
  @override
  _AddUpdateHouseState createState() => _AddUpdateHouseState();
}

class _AddUpdateHouseState extends State<AddUpdateHouse> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _house = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit House" : "Add New House"}'),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.house.title : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter house title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: ' title',border:OutlineInputBorder()),
                    onSaved: (value) {
                      setState(() {
                        this._house["title"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.house.category : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter House category';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'House Category'),
                    onSaved: (value) {
                      setState(() {
                        this._house["category"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                        widget.args.edit ? widget.args.house.status : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please status';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'House Status'),
                    onSaved: (value) {
                      setState(() {
                        this._house["status"] = value;
                      });
                    }),
                TextFormField(
                    minLines:
                        6, // any number you need (It works as the rows for the textarea)
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
                    decoration: InputDecoration(labelText: 'House Description'),
                    onSaved: (value) {
                      setState(() {
                        this._house["description"] = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        final HouseEvent event = widget.args.edit
                            ? HouseUpdate(
                                House(
                                  id: widget.args.house.id,
                                  title: this._house["title"],
                                  category: this._house["category"],
                                  status: this._house["status"],
                                  description: this._house["description"],
                                ),
                              )
                            : HouseCreate(
                                House(
                                  id:this._house["id"],
                                  title: this._house["title"],
                                  category: this._house["category"],
                                  status: this._house["status"],
                                  description: this._house["description"],
                                ),
                              );
                        BlocProvider.of<HouseBloc>(context).add(event);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            HouseList.routeName, (route) => false);
                      }
                    },
                    label: Text('SAVE'),
                    icon: Icon(Icons.save),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
