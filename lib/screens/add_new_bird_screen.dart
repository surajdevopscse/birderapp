import 'package:birderapp/models/birdlist_changenotifier.dart';
import 'package:birderapp/models/birdmodel.dart';
import 'package:birderapp/services/birdservices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewBird extends StatefulWidget {
  @override
  _AddNewBirdState createState() => _AddNewBirdState();
}

class _AddNewBirdState extends State<AddNewBird> {
  String? _txtName;
  String? _txtScientificName;
  String? _txtImageUrl;
  String? _txtId;
  String? _info;
  BirdModel _newbird = BirdModel();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildBirdId() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Id Required !";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Id:'),
      onSaved: (String? value) {
        _txtId = value;
      },
    );
  }

  Widget _buildBirdinfo() {
    return TextFormField(
      //keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Description Required !";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Description:'),
      onSaved: (String? value) {
        _info = value;
      },
    );
  }

  Widget _buildBirdName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name:'),
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Name Required !";
        }
        return null;
      },
      onSaved: (String? value) {
        _txtName = value;
      },
    );
  }

  Widget _buildBirdScientificName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Scientific Name:'),
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Scientific Name Required !";
        }
        return null;
      },
      onSaved: (String? value) {
        _txtScientificName = value;
      },
    );
  }

  Widget _buildBirdImageUrl() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Image Url:'),
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Image Url Required !";
        }
        return null;
      },
      onSaved: (String? value) {
        _txtImageUrl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Bird'), // a bad practise Text('$title')
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                _buildBirdId(),
                _buildBirdName(),
                _buildBirdScientificName(),
                _buildBirdImageUrl(),
                _buildBirdinfo(),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                    }

                    // save the bird

                    _newbird = BirdModel(
                        id: int.parse('$_txtId'),
                        name: _txtName,
                        scientificName: _txtScientificName,
                        imageUrl: _txtImageUrl,
                        info: _info,
                        likes: 0,
                        isFavrite: false);
                    // access listofbirds from ChangeNotifier
                    Provider.of<BirdListChangeNotifier>(
                      context,
                      listen: false,
                    ).addNewBirdToList(_newbird);

                    Navigator.of(context).pop('success');
                  },
                  child: Text('Add new bird'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
