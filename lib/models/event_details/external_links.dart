import 'facebook.dart';
import 'homepage.dart';
import 'instagram.dart';
import 'twitter.dart';
import 'wiki.dart';

class ExternalLinks {
	List<Twitter>? twitter;
	List<Wiki>? wiki;
	List<Facebook>? facebook;
	List<Instagram>? instagram;
	List<Homepage>? homepage;

	ExternalLinks({
		this.twitter, 
		this.wiki, 
		this.facebook, 
		this.instagram, 
		this.homepage, 
	});

	factory ExternalLinks.fromJson(Map<String, dynamic> json) => ExternalLinks(
				twitter: (json['twitter'] as List<dynamic>?)
						?.map((e) => Twitter.fromJson(e as Map<String, dynamic>))
						.toList(),
				wiki: (json['wiki'] as List<dynamic>?)
						?.map((e) => Wiki.fromJson(e as Map<String, dynamic>))
						.toList(),
				facebook: (json['facebook'] as List<dynamic>?)
						?.map((e) => Facebook.fromJson(e as Map<String, dynamic>))
						.toList(),
				instagram: (json['instagram'] as List<dynamic>?)
						?.map((e) => Instagram.fromJson(e as Map<String, dynamic>))
						.toList(),
				homepage: (json['homepage'] as List<dynamic>?)
						?.map((e) => Homepage.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'twitter': twitter?.map((e) => e.toJson()).toList(),
				'wiki': wiki?.map((e) => e.toJson()).toList(),
				'facebook': facebook?.map((e) => e.toJson()).toList(),
				'instagram': instagram?.map((e) => e.toJson()).toList(),
				'homepage': homepage?.map((e) => e.toJson()).toList(),
			};
}
