class ShortMovieModel {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  ShortMovieModel({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  ShortMovieModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
