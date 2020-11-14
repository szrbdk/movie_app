import 'package:progress_follower/model/job/job.dart';

class Crew {
  List<Job> production;
  List<Job> art;
  List<Job> sound;
  List<Job> costumeMakeUp;
  List<Job> writing;
  List<Job> visualEffects;
  List<Job> camera;
  List<Job> directing;
  List<Job> lighting;
  List<Job> crew;
  List<Job> editing;

  Crew({
    this.production,
    this.art,
    this.sound,
    this.costumeMakeUp,
    this.writing,
    this.visualEffects,
    this.camera,
    this.directing,
    this.lighting,
    this.crew,
    this.editing,
  });

  Crew copyWith({
    List<Job> production,
    List<Job> art,
    List<Job> sound,
    List<Job> costumeMakeUp,
    List<Job> writing,
    List<Job> visualEffects,
    List<Job> camera,
    List<Job> directing,
    List<Job> lighting,
    List<Job> crew,
    List<Job> editing,
  }) =>
      Crew(
        production: production ?? this.production,
        art: art ?? this.art,
        sound: sound ?? this.sound,
        costumeMakeUp: costumeMakeUp ?? this.costumeMakeUp,
        writing: writing ?? this.writing,
        visualEffects: visualEffects ?? this.visualEffects,
        camera: camera ?? this.camera,
        directing: directing ?? this.directing,
        lighting: lighting ?? this.lighting,
        crew: crew ?? this.crew,
        editing: editing ?? this.editing,
      );

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        production: json["production"] == null
            ? null
            : List<Job>.from(json["production"].map((x) => Job.fromJson(x))),
        art: json["art"] == null
            ? null
            : List<Job>.from(json["art"].map((x) => Job.fromJson(x))),
        sound: json["sound"] == null
            ? null
            : List<Job>.from(json["sound"].map((x) => Job.fromJson(x))),
        costumeMakeUp: json["costume & make-up"] == null
            ? null
            : List<Job>.from(
                json["costume & make-up"].map((x) => Job.fromJson(x))),
        writing: json["writing"] == null
            ? null
            : List<Job>.from(json["writing"].map((x) => Job.fromJson(x))),
        visualEffects: json["visual effects"] == null
            ? null
            : List<Job>.from(
                json["visual effects"].map((x) => Job.fromJson(x))),
        camera: json["camera"] == null
            ? null
            : List<Job>.from(json["camera"].map((x) => Job.fromJson(x))),
        directing: json["directing"] == null
            ? null
            : List<Job>.from(json["directing"].map((x) => Job.fromJson(x))),
        lighting: json["lighting"] == null
            ? null
            : List<Job>.from(json["lighting"].map((x) => Job.fromJson(x))),
        crew: json["crew"] == null
            ? null
            : List<Job>.from(json["crew"].map((x) => Job.fromJson(x))),
        editing: json["editing"] == null
            ? null
            : List<Job>.from(json["editing"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "production": production == null
            ? null
            : List<dynamic>.from(production.map((x) => x.toJson())),
        "art":
            art == null ? null : List<dynamic>.from(art.map((x) => x.toJson())),
        "sound": sound == null
            ? null
            : List<dynamic>.from(sound.map((x) => x.toJson())),
        "costume & make-up": costumeMakeUp == null
            ? null
            : List<dynamic>.from(costumeMakeUp.map((x) => x.toJson())),
        "writing": writing == null
            ? null
            : List<dynamic>.from(writing.map((x) => x.toJson())),
        "visual effects": visualEffects == null
            ? null
            : List<dynamic>.from(visualEffects.map((x) => x.toJson())),
        "camera": camera == null
            ? null
            : List<dynamic>.from(camera.map((x) => x.toJson())),
        "directing": directing == null
            ? null
            : List<dynamic>.from(directing.map((x) => x.toJson())),
        "lighting": lighting == null
            ? null
            : List<dynamic>.from(lighting.map((x) => x.toJson())),
        "crew": crew == null
            ? null
            : List<dynamic>.from(crew.map((x) => x.toJson())),
        "editing": editing == null
            ? null
            : List<dynamic>.from(editing.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Crew &&
        o.production == production &&
        o.art == art &&
        o.sound == sound &&
        o.costumeMakeUp == costumeMakeUp &&
        o.writing == writing &&
        o.visualEffects == visualEffects &&
        o.camera == camera &&
        o.directing == directing &&
        o.lighting == lighting &&
        o.crew == crew &&
        o.editing == editing;
  }

  @override
  int get hashCode {
    return production.hashCode ^
        art.hashCode ^
        sound.hashCode ^
        costumeMakeUp.hashCode ^
        writing.hashCode ^
        visualEffects.hashCode ^
        camera.hashCode ^
        directing.hashCode ^
        lighting.hashCode ^
        crew.hashCode ^
        editing.hashCode;
  }

  @override
  String toString() {
    return 'Crew production: $production, art: $art, sound: $sound, costumeMakeUp: $costumeMakeUp, writing: $writing, visualEffects: $visualEffects, camera: $camera, directing: $directing, lighting: $lighting, crew: $crew, editing: $editing';
  }
}
