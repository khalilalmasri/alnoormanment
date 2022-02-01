import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
}

class LoadAboutData extends AboutEvent {}

class UpdateAbout extends AboutEvent {

  final ValueAboutUs aboutUs;

  UpdateAbout({required this.aboutUs});

}
