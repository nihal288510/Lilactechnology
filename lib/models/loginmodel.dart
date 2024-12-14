class LoginModel {
  bool? status;
  String? message;
  Data? data;
  String? token;

  LoginModel({this.status, this.message, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? id;
  String? uniqueId;
  int? roleId;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? mobile;
  String? countryCode;
  Null? profileImage;
  Null? location;
  Null? latitude;
  Null? longitude;
  String? status;
  int? isActive;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? webToken;
  Vendor? vendor;
  Data(
      {this.id,
      this.uniqueId,
      this.roleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.mobile,
      this.countryCode,
      this.profileImage,
      this.location,
      this.latitude,
      this.longitude,
      this.status,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.webToken,
      this.vendor});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueId = json['unique_id'];
    roleId = json['role_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    profileImage = json['profile_image'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    webToken = json['web_token'];
    vendor =
        json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unique_id'] = this.uniqueId;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    data['profile_image'] = this.profileImage;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['web_token'] = this.webToken;
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    return data;
  }
}

class Vendor {
  int? id;
  int? fkUserId;
  String? businessAddress;
  String? tradeLicenceNumber;
  String? vehicleDealersLicence;
  String? logo;
  String? tradeLicenceImage;
  String? dealerLicenceImage;
  String? vendorStatus;
  String? isVerified;
  Null? remark;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Vendor(
      {this.id,
      this.fkUserId,
      this.businessAddress,
      this.tradeLicenceNumber,
      this.vehicleDealersLicence,
      this.logo,
      this.tradeLicenceImage,
      this.dealerLicenceImage,
      this.vendorStatus,
      this.isVerified,
      this.remark,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkUserId = json['fk_user_id'];
    businessAddress = json['business_address'];
    tradeLicenceNumber = json['trade_licence_number'];
    vehicleDealersLicence = json['vehicle_dealers_licence'];
    logo = json['logo'];
    tradeLicenceImage = json['trade_licence_image'];
    dealerLicenceImage = json['dealer_licence_image'];
    vendorStatus = json['vendor_status'];
    isVerified = json['is_verified'];
    remark = json['remark'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fk_user_id'] = this.fkUserId;
    data['business_address'] = this.businessAddress;
    data['trade_licence_number'] = this.tradeLicenceNumber;
    data['vehicle_dealers_licence'] = this.vehicleDealersLicence;
    data['logo'] = this.logo;
    data['trade_licence_image'] = this.tradeLicenceImage;
    data['dealer_licence_image'] = this.dealerLicenceImage;
    data['vendor_status'] = this.vendorStatus;
    data['is_verified'] = this.isVerified;
    data['remark'] = this.remark;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
