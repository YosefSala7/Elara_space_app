import 'package:dartz/dartz.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<String, List<PlanetModel>>> getPlanets() async {
  supabase = Supabase.instance;
  try {} catch (e) {}
}
