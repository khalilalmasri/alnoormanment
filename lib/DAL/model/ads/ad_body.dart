import 'package:equatable/equatable.dart';

class AdBody extends Equatable {
  AdBody( {
    required this.id,
    required this.name,
    required this.image,
    required this.link,
    required this.isActive,
  });

   int id;
   String name;
   String image;
   String link;
   bool isActive;



  @override
  List<Object> get props => [id, name, image, link, isActive];
}
