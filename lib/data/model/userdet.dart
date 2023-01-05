class userdet {
  String? prefincome;
  String? profession;
  String? prefedu;
  String? prefdiet;
  String? agemin;
  String? agemax;
  String? prefcntry;
  String? prefst;
  String? prefms;
  String? prefrel;
  String? id;
  String? userType;
  String? roleId;
  String? code;
  String? membership;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? newEmailVerificiationCode;
  String? phone;
  String? verificationCode;
  String? password;
  String? providerId;
  String? photo;
  String? rememberToken;
  String? lastLoginIp;
  String? lastLoginAt;
  String? blocked;
  String? deactivated;
  String? permanentlyDelete;
  String? approved;
  String? balance;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? uid;
  String? userId;
  String? height;
  String? weight;
  String? eyeColor;
  String? hairColor;
  String? complexion;
  String? bloodGroup;
  String? bodyType;
  String? bodyArt;
  String? disability;
  String? state;
  String? country;
  String? city;
  String? degree;
  String? diet;
  String? gender;
  String? birthday;
  String? introduction;
  String? maritalStatusId;
  String? children;
  String? onBehalvesId;
  String? mothereTongue;
  String? knownLanguages;
  String? currentPackageId;
  String? remainingInterest;
  String? remainingContactView;
  String? remainingPhotoGallery;
  String? autoProfileMatch;
  String? packageValidity;
  String? profilePicturePrivacy;
  String? galleryImagePrivacy;
  String? ignoredUsers;
  String? ignoredBy;
  String? reportedUser;
  String? reportedBy;
  String? blockedReason;
  String? marital;
  String? designation;
  String? company;
  String? start;
  String? end;
  String? present;
  String? sector;
  String? income;
  String? religion;
  String? curr;
  String? reqq;
  String? req;
  String? bk;
  String? sis;
  String? br;
  String? dk;
  String? sk;
  String? lans;
  String? dkp;
  String? skp;
  String? lansp;
  String? cityp;
  String? prefcur;
  String? pdsr;
  String? maxpr;
  String? arpm;
  userdet(
      {
        this.prefincome,
        this.profession,
        this.prefedu,
        this.prefdiet,
        this.agemin,
        this.agemax,
        this.prefcntry,
        this.prefst,
        this.prefms,
        this.prefrel,

        this.id,
        this.userType,
        this.roleId,
        this.code,
        this.membership,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.newEmailVerificiationCode,
        this.phone,
        this.verificationCode,
        this.password,
        this.providerId,
        this.photo,
        this.rememberToken,
        this.lastLoginIp,
        this.lastLoginAt,
        this.blocked,
        this.deactivated,
        this.permanentlyDelete,
        this.approved,
        this.balance,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.uid,
        this.userId,
        this.height,
        this.weight,
        this.eyeColor,
        this.hairColor,
        this.complexion,
        this.bloodGroup,
        this.bodyType,
        this.bodyArt,
        this.disability,
        this.state,
        this.country,
        this.city,
        this.degree,
        this.diet,
        this.gender,
        this.birthday,
        this.introduction,
        this.maritalStatusId,
        this.children,
        this.onBehalvesId,
        this.mothereTongue,
        this.knownLanguages,
        this.currentPackageId,
        this.remainingInterest,
        this.remainingContactView,
        this.remainingPhotoGallery,
        this.autoProfileMatch,
        this.packageValidity,
        this.profilePicturePrivacy,
        this.galleryImagePrivacy,
        this.ignoredUsers,
        this.ignoredBy,
        this.reportedUser,
        this.reportedBy,
        this.blockedReason,
        this.marital,
        this.designation,
        this.company,
        this.start,
        this.end,
        this.present,
        this.sector,
        this.income,
        this.religion,
        this.curr,
        this.reqq,
        this.req,
        this.bk,
        this.sis,
        this.br,
        this.dk,
        this.sk,
        this.lans,
        this.dkp,
        this.skp,
        this.lansp,
        this.cityp,
        this.prefcur,
        this.pdsr,
        this.maxpr,
        this.arpm,
      });

  userdet.fromJson(Map<String?, dynamic> json) {
    prefincome = json['prefincome'];
    profession = json['profession'];
    prefedu = json['prefedu'];
    prefdiet = json['prefdiet'];
    agemin = json['agemin'];
    agemax = json['agemax'];
    prefcntry = json['prefcntry'];
    prefst = json['prefst'];
    prefms = json['prefms'];
    prefrel = json['prefrel'];
    id = json['id'];
    userType = json['user_type'];
    roleId = json['role_id'];
    code = json['code'];
    membership = json['membership'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    newEmailVerificiationCode = json['new_email_verificiation_code'];
    phone = json['phone'];
    verificationCode = json['verification_code'];
    password = json['password'];
    providerId = json['provider_id'];
    photo = json['photo'];
    rememberToken = json['remember_token'];
    lastLoginIp = json['last_login_ip'];
    lastLoginAt = json['last_login_at'];
    blocked = json['blocked'];
    deactivated = json['deactivated'];
    permanentlyDelete = json['permanently_delete'];
    approved = json['approved'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    uid = json['uid'];
    userId = json['user_id'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eye_color'];
    hairColor = json['hair_color'];
    complexion = json['complexion'];
    bloodGroup = json['blood_group'];
    bodyType = json['body_type'];
    bodyArt = json['body_art'];
    disability = json['disability'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    degree = json['degree'];
    diet = json['diet'];
    gender = json['gender'];
    birthday = json['birthday'];
    introduction = json['introduction'];
    maritalStatusId = json['marital_status_id'];
    children = json['children'];
    onBehalvesId = json['on_behalves_id'];
    mothereTongue = json['mothere_tongue'];
    knownLanguages = json['known_languages'];
    currentPackageId = json['current_package_id'];
    remainingInterest = json['remaining_interest'];
    remainingContactView = json['remaining_contact_view'];
    remainingPhotoGallery = json['remaining_photo_gallery'];
    autoProfileMatch = json['auto_profile_match'];
    packageValidity = json['package_validity'];
    profilePicturePrivacy = json['profile_picture_privacy'];
    galleryImagePrivacy = json['gallery_image_privacy'];
    ignoredUsers = json['ignored_users'];
    ignoredBy = json['ignored_by'];
    reportedUser = json['reported_user'];
    reportedBy = json['reported_by'];
    blockedReason = json['blocked_reason'];
    marital = json['marital'];
    designation = json['designation'];
    company = json['company'];
    start = json['start'];
    end = json['end'];
    present = json['present'];
    sector = json['sector'];
    income = json['income'];
    religion = json['religion'];
    curr = json['curr'];
    reqq = json['reqq'];
    req = json['req'];
    bk = json['bk'];
    sis = json['sisters'];
    br = json['brothers'];
    dk = json['drink'];
    sk = json['smoke'];
    lans = json['lans'];
    dkp = json['drinking_acceptable'];
    skp = json['smoking_acceptable'];
    lansp = json['preflang'];
    cityp = json['prefcity'];
    prefcur = json['prefcur'];
    pdsr = json['pdsr'];
    maxpr = json['maxpr'];
    arpm = json['arpm'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['prefincome'] = this.prefincome;
    data['profession'] = this.profession;
    data['prefedu'] = this.prefedu;
    data['prefdiet'] = this.prefdiet;
    data['agemin'] = this.agemin;
    data['agemax'] = this.agemax;
    data['prefcntry'] = this.prefcntry;
    data['prefst'] = this.prefst;
    data['prefms'] = this.prefms;
    data['prefrel'] = this.prefrel;
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['role_id'] = this.roleId;
    data['code'] = this.code;
    data['membership'] = this.membership;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['new_email_verificiation_code'] = this.newEmailVerificiationCode;
    data['phone'] = this.phone;
    data['verification_code'] = this.verificationCode;
    data['password'] = this.password;
    data['provider_id'] = this.providerId;
    data['photo'] = this.photo;
    data['remember_token'] = this.rememberToken;
    data['last_login_ip'] = this.lastLoginIp;
    data['last_login_at'] = this.lastLoginAt;
    data['blocked'] = this.blocked;
    data['deactivated'] = this.deactivated;
    data['permanently_delete'] = this.permanentlyDelete;
    data['approved'] = this.approved;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['uid'] = this.uid;
    data['user_id'] = this.userId;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eye_color'] = this.eyeColor;
    data['hair_color'] = this.hairColor;
    data['complexion'] = this.complexion;
    data['blood_group'] = this.bloodGroup;
    data['body_type'] = this.bodyType;
    data['body_art'] = this.bodyArt;
    data['disability'] = this.disability;
    data['state'] = this.state;
    data['country'] = this.country;
    data['city'] = this.city;
    data['degree'] = this.degree;
    data['diet'] = this.diet;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['introduction'] = this.introduction;
    data['marital_status_id'] = this.maritalStatusId;
    data['children'] = this.children;
    data['on_behalves_id'] = this.onBehalvesId;
    data['mothere_tongue'] = this.mothereTongue;
    data['known_languages'] = this.knownLanguages;
    data['current_package_id'] = this.currentPackageId;
    data['remaining_interest'] = this.remainingInterest;
    data['remaining_contact_view'] = this.remainingContactView;
    data['remaining_photo_gallery'] = this.remainingPhotoGallery;
    data['auto_profile_match'] = this.autoProfileMatch;
    data['package_validity'] = this.packageValidity;
    data['profile_picture_privacy'] = this.profilePicturePrivacy;
    data['gallery_image_privacy'] = this.galleryImagePrivacy;
    data['ignored_users'] = this.ignoredUsers;
    data['ignored_by'] = this.ignoredBy;
    data['reported_user'] = this.reportedUser;
    data['reported_by'] = this.reportedBy;
    data['blocked_reason'] = this.blockedReason;
    data['marital'] = this.marital;
    data['designation'] = this.designation;
    data['company'] = this.company;
    data['start'] = this.start;
    data['end'] = this.end;
    data['present'] = this.present;
    data['sector'] = this.sector;
    data['income'] = this.income;
    data['religion'] = this.religion;
    data['curr'] = this.curr;
    data['reqq'] = this.reqq;
    data['req'] = this.req;
    data['bk'] = this.bk;
    data['pdsr'] = this.pdsr;
    data['maxpr'] = this.maxpr;
    data['arpm'] = this.arpm;
    return data;
  }
}
