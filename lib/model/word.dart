import 'package:demo/demo.dart';

class Word extends ManagedObject<_Word> implements _Word {

}

class _Word {
  @primaryKey
  int id;

  @Column(unique: true, indexed: true)
  String word;

  @Validate.present()
  Document content;
}