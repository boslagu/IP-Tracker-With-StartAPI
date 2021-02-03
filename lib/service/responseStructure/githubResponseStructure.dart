
class GithubResponseStructure{
  String name;
  String avatar;
  String bio;
  String repoLink;

  GithubResponseStructure({this.name, this.avatar, this.bio, this.repoLink});

  factory GithubResponseStructure.fromJson(Map<String, dynamic> json){
    return GithubResponseStructure(
      name : json["name"] as String,
      avatar : json["avatar_url"] as String,
      bio : json["bio"] as String,
      repoLink : json["repos_url"] as String,
    );
  }
}


class ReposResponseStructure{
  String name;
  String url;

  ReposResponseStructure({this.name, this.url});


  factory ReposResponseStructure.fromJson(Map<String, dynamic> json){
    return ReposResponseStructure(
      name : json["name"] as String,
      url : json["html_url"] as String,
    );
  }
}