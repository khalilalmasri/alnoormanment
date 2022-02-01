import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'about_us_repository.dart';
import 'remote/api_repository.dart';

class AboutUsRepositoryImpl extends AboutRepository {
  final ApiRepository apiRepository;

  static final AboutUsRepositoryImpl _singleton =
      AboutUsRepositoryImpl._internal(apiRepository: ApiRepository());

  factory AboutUsRepositoryImpl() {
    return _singleton;
  }

  AboutUsRepositoryImpl._internal({required this.apiRepository});

  @override
  Future<AboutUsResponse> getAbout() async {
    return await apiRepository.getAbout();
  }

  @override
  Future<AboutUsResponse> updateAbout(ValueAboutUs aboutUs) async {
    return await apiRepository.updateAbout(aboutUs);
  }
}
