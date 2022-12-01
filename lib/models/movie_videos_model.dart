



class MovieVideosList {
  int? movieId;
  List<MovieVideo>? moviesVideos;

  MovieVideosList({this.movieId, this.moviesVideos});

  MovieVideosList.fromJson(Map<String, dynamic> json) {
    movieId = json['id'];
    if (json['results'] != null) {
      moviesVideos = [];
      json['results'].forEach((v) {
        moviesVideos!.add(MovieVideo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.movieId;
    if (this.moviesVideos != null) {
      data['results'] = this.moviesVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieVideo {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  MovieVideo(
      {this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id});

  MovieVideo.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['key'] = this.key;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    data['official'] = this.official;
    data['published_at'] = this.publishedAt;
    data['id'] = this.id;
    return data;
  }
}


//{
//     "id": 550988,
//     "results": [
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Free Guy | Enter Dude | Trailer",
//             "key": "jRn48HxssPI",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Clip",
//             "official": true,
//             "published_at": "2021-08-02T22:04:37.000Z",
//             "id": "610896cde61e6d0022d7ab61"
//         },
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Free Guy Exclusive Movie Clip - Sweet Fantasy (2021) | Movieclips Coming Soon",
//             "key": "BqR-mVP5ffQ",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Clip",
//             "official": false,
//             "published_at": "2021-08-02T13:00:05.000Z",
//             "id": "6107ed5cc613ce005fad948f"
//         },
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Free Guy - Official Blue Shirt Guy Clip (2021) Ryan Reynolds, Joe Kerry, Utkarsh Ambudkar",
//             "key": "ihuIjapV3Eg",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Clip",
//             "official": false,
//             "published_at": "2021-07-30T02:00:12.000Z",
//             "id": "61035f31a217c00046c42b3d"
//         },
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Free Guy | New Trailer | 20th Century Studios",
//             "key": "cttnRmcr_ME",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Trailer",
//             "official": true,
//             "published_at": "2021-06-10T07:00:08.000Z",
//             "id": "60e49e1727ff990074deb7d2"
//         },
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Free Guy | Official Trailer | 20th Century Studios",
//             "key": "JORN2hkXLyM",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Trailer",
//             "official": true,
//             "published_at": "2020-10-05T13:00:27.000Z",
//             "id": "5f7bd19a1fd36f003852cb3b"
//         },
//         {
//             "iso_639_1": "en",
//             "iso_3166_1": "US",
//             "name": "Official Trailer",
//             "key": "X2m-08cOAbc",
//             "site": "YouTube",
//             "size": 1080,
//             "type": "Trailer",
//             "official": true,
//             "published_at": "2019-12-07T18:32:52.000Z",
//             "id": "5debf39fdaf57c0013ea627e"
//         }
//     ]
// }