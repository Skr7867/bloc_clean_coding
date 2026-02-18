// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

// @freezed
// abstract class UserModel with _$UserModel {
//   const factory UserModel({
//     @Default('') @JsonKey(name: 'token') String token,
//     @Default('') @JsonKey(name: 'error') String error,
//   }) = _UserModel;

//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);
// }

class UserModel {
  String? message;
  String? token;
  User? user;

  UserModel({this.message, this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  SocialLinks? socialLinks;
  Settings? settings;
  Wallet? wallet;
  Subscription? subscription;
  SubscriptionFeatures? subscriptionFeatures;
  Referrals? referrals;
  Status? status;
  Null creatorRequestReason;
  String? sId;
  String? fullName;
  String? username;
  String? email;
  Avatar? avatar;
  List<String>? purchasedAvatars;
  List<dynamic>? interests;
  List<String>? enrolledCourses;
  String? role;
  int? xp;
  int? level;
  List<Badges>? badges;
  bool? isPendingCreatorRequest;
  int? currentStreak;
  int? maxStreak;
  List<String>? loginHistory;
  bool? isDeleted;
  bool? isSuspended;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lastLogin;
  int? usernameUpdateCount;
  String? bio;
  bool? isAlreadyCreator;
  String? preferredLandingPage;
  List<String>? blockedUsers;
  bool? isPrivate;
  bool? hasCreatedFirstClip;
  bool? hasPurchasedFirstCourse;
  bool? creatorByAdmin;
  bool? isConsent;
  List<String>? repost;
  String? lastStreakUpdate;
  List<String>? streakHistory;
  List<String>? fcmTokens;
  String? activeProfile;
  String? profilePictureUrl;

  User({
    this.socialLinks,
    this.settings,
    this.wallet,
    this.subscription,
    this.subscriptionFeatures,
    this.referrals,
    this.status,
    this.creatorRequestReason,
    this.sId,
    this.fullName,
    this.username,
    this.email,
    this.avatar,
    this.purchasedAvatars,
    this.interests,
    this.enrolledCourses,
    this.role,
    this.xp,
    this.level,
    this.badges,
    this.isPendingCreatorRequest,
    this.currentStreak,
    this.maxStreak,
    this.loginHistory,
    this.isDeleted,
    this.isSuspended,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.lastLogin,
    this.usernameUpdateCount,
    this.bio,
    this.isAlreadyCreator,
    this.preferredLandingPage,
    this.blockedUsers,
    this.isPrivate,
    this.hasCreatedFirstClip,
    this.hasPurchasedFirstCourse,
    this.creatorByAdmin,
    this.isConsent,
    this.repost,
    this.lastStreakUpdate,
    this.streakHistory,
    this.fcmTokens,
    this.activeProfile,
    this.profilePictureUrl,
  });

  User.fromJson(Map<String, dynamic> json) {
    socialLinks = json['socialLinks'] != null
        ? new SocialLinks.fromJson(json['socialLinks'])
        : null;
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    wallet = json['wallet'] != null
        ? new Wallet.fromJson(json['wallet'])
        : null;
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    subscriptionFeatures = json['subscriptionFeatures'] != null
        ? new SubscriptionFeatures.fromJson(json['subscriptionFeatures'])
        : null;
    referrals = json['referrals'] != null
        ? new Referrals.fromJson(json['referrals'])
        : null;
    status = json['status'] != null
        ? new Status.fromJson(json['status'])
        : null;
    creatorRequestReason = json['creatorRequestReason'];
    sId = json['_id'];
    fullName = json['fullName'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'] != null
        ? new Avatar.fromJson(json['avatar'])
        : null;
    purchasedAvatars = json['purchasedAvatars'].cast<String>();
    if (json['interests'] != null) {
      interests = <Null>[];
      ;
    }
    enrolledCourses = json['enrolledCourses'].cast<String>();
    role = json['role'];
    xp = json['xp'];
    level = json['level'];
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(new Badges.fromJson(v));
      });
    }
    isPendingCreatorRequest = json['isPendingCreatorRequest'];
    currentStreak = json['currentStreak'];
    maxStreak = json['maxStreak'];
    loginHistory = json['loginHistory'].cast<String>();
    isDeleted = json['isDeleted'];
    isSuspended = json['isSuspended'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    lastLogin = json['lastLogin'];
    usernameUpdateCount = json['usernameUpdateCount'];
    bio = json['bio'];
    isAlreadyCreator = json['isAlreadyCreator'];
    preferredLandingPage = json['preferredLandingPage'];
    blockedUsers = json['blockedUsers'].cast<String>();
    isPrivate = json['isPrivate'];
    hasCreatedFirstClip = json['hasCreatedFirstClip'];
    hasPurchasedFirstCourse = json['hasPurchasedFirstCourse'];
    creatorByAdmin = json['creatorByAdmin'];
    isConsent = json['isConsent'];
    repost = json['repost'].cast<String>();
    lastStreakUpdate = json['lastStreakUpdate'];
    streakHistory = json['streakHistory'].cast<String>();
    fcmTokens = json['fcmTokens'].cast<String>();
    activeProfile = json['activeProfile'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.socialLinks != null) {
      data['socialLinks'] = this.socialLinks!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    if (this.subscriptionFeatures != null) {
      data['subscriptionFeatures'] = this.subscriptionFeatures!.toJson();
    }
    if (this.referrals != null) {
      data['referrals'] = this.referrals!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['creatorRequestReason'] = this.creatorRequestReason;
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['purchasedAvatars'] = this.purchasedAvatars;

    data['enrolledCourses'] = this.enrolledCourses;
    data['role'] = this.role;
    data['xp'] = this.xp;
    data['level'] = this.level;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    data['isPendingCreatorRequest'] = this.isPendingCreatorRequest;
    data['currentStreak'] = this.currentStreak;
    data['maxStreak'] = this.maxStreak;
    data['loginHistory'] = this.loginHistory;
    data['isDeleted'] = this.isDeleted;
    data['isSuspended'] = this.isSuspended;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['lastLogin'] = this.lastLogin;
    data['usernameUpdateCount'] = this.usernameUpdateCount;
    data['bio'] = this.bio;
    data['isAlreadyCreator'] = this.isAlreadyCreator;
    data['preferredLandingPage'] = this.preferredLandingPage;
    data['blockedUsers'] = this.blockedUsers;
    data['isPrivate'] = this.isPrivate;
    data['hasCreatedFirstClip'] = this.hasCreatedFirstClip;
    data['hasPurchasedFirstCourse'] = this.hasPurchasedFirstCourse;
    data['creatorByAdmin'] = this.creatorByAdmin;
    data['isConsent'] = this.isConsent;
    data['repost'] = this.repost;
    data['lastStreakUpdate'] = this.lastStreakUpdate;
    data['streakHistory'] = this.streakHistory;
    data['fcmTokens'] = this.fcmTokens;
    data['activeProfile'] = this.activeProfile;
    data['profilePictureUrl'] = this.profilePictureUrl;
    return data;
  }
}

class SocialLinks {
  String? instagram;
  String? twitter;
  String? linkedin;
  String? website;

  SocialLinks({this.instagram, this.twitter, this.linkedin, this.website});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    instagram = json['instagram'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['website'] = this.website;
    return data;
  }
}

class Settings {
  Notifications? notifications;
  Appearance? appearance;
  TwoFactorAuth? twoFactorAuth;
  String? resetPasswordOTP;
  String? resetPasswordOTPExpires;

  Settings({
    this.notifications,
    this.appearance,
    this.twoFactorAuth,
    this.resetPasswordOTP,
    this.resetPasswordOTPExpires,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    notifications = json['notifications'] != null
        ? new Notifications.fromJson(json['notifications'])
        : null;
    appearance = json['appearance'] != null
        ? new Appearance.fromJson(json['appearance'])
        : null;
    twoFactorAuth = json['twoFactorAuth'] != null
        ? new TwoFactorAuth.fromJson(json['twoFactorAuth'])
        : null;
    resetPasswordOTP = json['resetPasswordOTP'];
    resetPasswordOTPExpires = json['resetPasswordOTPExpires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] = this.notifications!.toJson();
    }
    if (this.appearance != null) {
      data['appearance'] = this.appearance!.toJson();
    }
    if (this.twoFactorAuth != null) {
      data['twoFactorAuth'] = this.twoFactorAuth!.toJson();
    }
    data['resetPasswordOTP'] = this.resetPasswordOTP;
    data['resetPasswordOTPExpires'] = this.resetPasswordOTPExpires;
    return data;
  }
}

class Notifications {
  bool? push;
  bool? email;
  bool? chat;
  bool? spaces;
  bool? courses;

  Notifications({this.push, this.email, this.chat, this.spaces, this.courses});

  Notifications.fromJson(Map<String, dynamic> json) {
    push = json['push'];
    email = json['email'];
    chat = json['chat'];
    spaces = json['spaces'];
    courses = json['courses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['push'] = this.push;
    data['email'] = this.email;
    data['chat'] = this.chat;
    data['spaces'] = this.spaces;
    data['courses'] = this.courses;
    return data;
  }
}

class Appearance {
  String? theme;
  String? language;
  String? fontSize;

  Appearance({this.theme, this.language, this.fontSize});

  Appearance.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
    language = json['language'];
    fontSize = json['fontSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['theme'] = this.theme;
    data['language'] = this.language;
    data['fontSize'] = this.fontSize;
    return data;
  }
}

class TwoFactorAuth {
  bool? enabled;
  bool? verified;
  String? method;
  String? tempSecret;
  String? emailOTP;
  String? emailOTPExpires;

  TwoFactorAuth({
    this.enabled,
    this.verified,
    this.method,
    this.tempSecret,
    this.emailOTP,
    this.emailOTPExpires,
  });

  TwoFactorAuth.fromJson(Map<String, dynamic> json) {
    enabled = json['enabled'];
    verified = json['verified'];
    method = json['method'];
    tempSecret = json['tempSecret'];
    emailOTP = json['emailOTP'];
    emailOTPExpires = json['emailOTPExpires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enabled'] = this.enabled;
    data['verified'] = this.verified;
    data['method'] = this.method;
    data['tempSecret'] = this.tempSecret;
    data['emailOTP'] = this.emailOTP;
    data['emailOTPExpires'] = this.emailOTPExpires;
    return data;
  }
}

class Wallet {
  int? coins;
  int? totalEarned;
  int? totalSpent;
  String? lastUpdated;

  Wallet({this.coins, this.totalEarned, this.totalSpent, this.lastUpdated});

  Wallet.fromJson(Map<String, dynamic> json) {
    coins = json['coins'];
    totalEarned = json['totalEarned'];
    totalSpent = json['totalSpent'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coins'] = this.coins;
    data['totalEarned'] = this.totalEarned;
    data['totalSpent'] = this.totalSpent;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Subscription {
  String? planId;
  String? status;
  String? startDate;
  String? endDate;

  Subscription({this.planId, this.status, this.startDate, this.endDate});

  Subscription.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this.planId;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}

class SubscriptionFeatures {
  int? reactionEmoji;
  int? stickerPack;
  int? publicGroup;
  bool? animatedAvatar;
  bool? premiumIcon;
  String? premiumIconUrl;
  bool? sharedLiveLocation;
  int? fileUploadSize;
  int? totalCourseCreation;

  SubscriptionFeatures({
    this.reactionEmoji,
    this.stickerPack,
    this.publicGroup,
    this.animatedAvatar,
    this.premiumIcon,
    this.premiumIconUrl,
    this.sharedLiveLocation,
    this.fileUploadSize,
    this.totalCourseCreation,
  });

  SubscriptionFeatures.fromJson(Map<String, dynamic> json) {
    reactionEmoji = json['reaction_emoji'];
    stickerPack = json['sticker_pack'];
    publicGroup = json['public_group'];
    animatedAvatar = json['animated_avatar'];
    premiumIcon = json['premium_icon'];
    premiumIconUrl = json['premiumIconUrl'];
    sharedLiveLocation = json['shared_live_location'];
    fileUploadSize = json['file_upload_size'];
    totalCourseCreation = json['total_course_creation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reaction_emoji'] = this.reactionEmoji;
    data['sticker_pack'] = this.stickerPack;
    data['public_group'] = this.publicGroup;
    data['animated_avatar'] = this.animatedAvatar;
    data['premium_icon'] = this.premiumIcon;
    data['premiumIconUrl'] = this.premiumIconUrl;
    data['shared_live_location'] = this.sharedLiveLocation;
    data['file_upload_size'] = this.fileUploadSize;
    data['total_course_creation'] = this.totalCourseCreation;
    return data;
  }
}

class Referrals {
  Null referredBy;
  List<String>? referredUsers;
  String? referralCode;

  Referrals({this.referredBy, this.referredUsers, this.referralCode});

  Referrals.fromJson(Map<String, dynamic> json) {
    referredBy = json['referredBy'];
    referredUsers = json['referredUsers'].cast<String>();
    referralCode = json['referralCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referredBy'] = this.referredBy;
    data['referredUsers'] = this.referredUsers;
    data['referralCode'] = this.referralCode;
    return data;
  }
}

class Status {
  bool? isOnline;
  String? lastSeen;

  Status({this.isOnline, this.lastSeen});

  Status.fromJson(Map<String, dynamic> json) {
    isOnline = json['isOnline'];
    lastSeen = json['lastSeen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isOnline'] = this.isOnline;
    data['lastSeen'] = this.lastSeen;
    return data;
  }
}

class Avatar {
  String? sId;
  String? imageUrl;

  Avatar({this.sId, this.imageUrl});

  Avatar.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Badges {
  String? sId;
  String? name;
  String? description;
  int? xpRequired;
  String? iconUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Badges({
    this.sId,
    this.name,
    this.description,
    this.xpRequired,
    this.iconUrl,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Badges.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    xpRequired = json['xpRequired'];
    iconUrl = json['iconUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['xpRequired'] = this.xpRequired;
    data['iconUrl'] = this.iconUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
