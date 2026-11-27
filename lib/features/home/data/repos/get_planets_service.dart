import 'package:dartz/dartz.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<String, List<PlanetModel>>> getEnPlanetsApi() async {
  try {
    final response = await Supabase.instance.client.from('planets').select().order("id",ascending: true);
    List<PlanetModel> planets = (response as List)
        .map((json) => PlanetModel.fromJson(json))
        .toList();
    return Right(planets);
  } catch (e) {
    return Left(e.toString());
  }
}
Future<Either<String, List<PlanetModel>>> getArPlanetsApi() async {
  try {
    final response = await Supabase.instance.client.from('planets_AR').select().order("id",ascending: true);
    List<PlanetModel> planets = (response as List)
        .map((json) => PlanetModel.fromJson(json))
        .toList();
    return Right(planets);
  } catch (e) {
    return Left(e.toString());
  }
}