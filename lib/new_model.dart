class SourceModel{
  String? id;
  String? name;
  SourceModel({this.id, this.name});
  SourceModel.fromjson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
  }
}
class ArticlesModel{
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticlesModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  ArticlesModel.fromjson(Map<String,dynamic>json){
    if(json['source']!=null){
      source=SourceModel.fromjson(json['source']);
    }
    author=json['author'];
    title=json['title'];
    description=json['description'];
    url=json['url'];
    urlToImage=json['urlToImage'];
    publishedAt=json['publishedAt'];
    content=json['content'];
  }
}
class NewsModel{
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;
  NewsModel({this.status,this.articles,this.totalResults});
  NewsModel.formjson(Map<String,dynamic>json){
    status=json['status'];
    totalResults=json['totalResults'];
    if(json['articles']!=null){
      articles=[];
      json['articles'].forEach((e){
        articles!.add(ArticlesModel.fromjson(json['articles']));
      });
    }
  }
}
class CoordModel{
  double? lon;
  double? lat;
  CoordModel({this.lat,this.lon});
  CoordModel.formjson(Map<String,dynamic>json){
    lon=json['lon'];
    lat=json['lat'];
  }
}
class MainModel{
  double?temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  MainModel({this.temp,this.feelsLike,this.tempMin,this.tempMax,this.pressure,this.grndLevel,this.humidity,this.seaLevel});
  MainModel.fromjson(Map<String,dynamic>json){
    temp=json['temp'];
    feelsLike=json['feels_like'];
    tempMin=json['temp_min'];
    tempMax=json['temp_max'];
    pressure=json['pressure'];
    humidity=json['humidity'];
    seaLevel=json['sea_level'];
    grndLevel=json['grnd_level'];
  }
}
class WeatherModel{
  int? id;
  String? main;
  String? description;
  String? icon;
  WeatherModel({this.id,this.main,this.description,this.icon});
  WeatherModel.fromjson(Map<String,dynamic>json){
    id=json['id'];
    main=json['main'];
    description=json['description'];
    icon=json['icon'];}
}
class WindModel{
  double? speed;
  int? deg;
  double? gust;
  WindModel({this.speed,this.deg,this.gust});
  WindModel.fromjson(Map<String,dynamic>json){
    speed=json['speed'];
    deg=json['deg'];
    gust=json['gust'];
  }
}
class CloudsModel{
  int? all;
  CloudsModel({this.all});
  CloudsModel.formjson(Map<String,dynamic>json){
    all=json['all'];
  }
}
class SysModel{
  String? country;
  int? sunrise;
  int? sunset;
  SysModel({this.country,this.sunrise,this.sunset});
  SysModel.fromjson(Map<String,dynamic>json){
    country=json['country'];
    sunrise=json['sunrise'];
    sunset=json['sunset'];}
}

class WeatherResponseModel{
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timeZone;
  int? id;
  String? name;
  int? cod;
  WeatherResponseModel({this.coord,this.weather,this.base,this.main,this.visibility,this.wind,this.clouds,this.name,this.id,this.sys,this.cod,this.dt,this.timeZone});
  WeatherResponseModel.fromjson(Map<String,dynamic>json){
    if(json['coord']!=null){
      coord=CoordModel.formjson(json['coord']);
    }
    if(json['weather']!=null){
      weather=[];
      json['weather'].forEach((e){
        weather!.add(WeatherModel.fromjson(e));
      });
    }
    base=json['base'];
    if(json['main']!=null){
      main=MainModel.fromjson(json['main']);
    }
    visibility=json['visibility'];
    if(json['wind']!=null){
      wind=WindModel.fromjson(json['wind']);
    }
    if(json['clouds']!=null){
      clouds=CloudsModel.formjson(json['clouds']);
    }
    dt=json['dt'];
    if(json['sys']!=null){
      sys=SysModel.fromjson(json['sys']);}
    timeZone=json['timezone'];
    id=json['id'];
    name=json['name'];
    cod=json['cod'];
  }

}