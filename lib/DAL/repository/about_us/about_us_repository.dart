import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';


abstract class AboutRepository {
  Future<AboutUsResponse> getAbout();

  Future<AboutUsResponse> updateAbout(ValueAboutUs aboutUs);
}
