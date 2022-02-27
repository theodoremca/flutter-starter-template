class AssetModel {
  AssetModel({
    required this.assets,
  });
  late final List<Assets> assets;
  
  AssetModel.fromJson(Map<String, dynamic> json){
    assets = List.from(json['assets']).map((e)=>Assets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['assets'] = assets.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Assets {
  Assets({
    required this.id,
    required this.numSales,
     this.backgroundColor,
    required this.imageUrl,
     this.imagePreviewUrl,
     this.imageThumbnailUrl,
     this.imageOriginalUrl,
     this.animationUrl,
     this.animationOriginalUrl,
     this.name,
     this.description,
     this.externalLink,
    required this.assetContract,
    required this.permalink,
    required this.collection,
     this.decimals,
     this.tokenMetadata,
    required this.owner,
     this.sellOrders,
    required this.creator,
    required this.traits,
     this.lastSale,
     this.topBid,
     this.listingDate,
    required this.isPresale,
     this.transferFeePaymentToken,
     this.transferFee,
    required this.tokenId,
  });
  late final int? id;
  late final int? numSales;
  late final Null? backgroundColor;
  late final String? imageUrl;
  late final String? imagePreviewUrl;
  late final String? imageThumbnailUrl;
  late final Null? imageOriginalUrl;
  late final Null? animationUrl;
  late final Null? animationOriginalUrl;
  late final String? name;
  late final String? description;
  late final Null? externalLink;
  late final AssetContract? assetContract;
  late final String? permalink;
  late final Collection? collection;
  late final Null? decimals;
  late final Null? tokenMetadata;
  late final Owner? owner;
  late final Null? sellOrders;
  late final Creator? creator;
  late final List<Traits?>? traits;
  late final Null? lastSale;
  late final Null? topBid;
  late final Null? listingDate;
  late final bool? isPresale;
  late final Null? transferFeePaymentToken;
  late final Null? transferFee;
  late final String? tokenId;
  
  Assets.fromJson(Map<String, dynamic> json){
    id = json['id'];
    // numSales = json['num_sales'];
    // backgroundColor = null;
    imageUrl = json['image_url'];
    // imagePreviewUrl = json['image_url'];
    imageThumbnailUrl = json['image_thumbnail_url'];
    // imageOriginalUrl = null;
    // animationUrl = null;
    // animationOriginalUrl = null;
    name = json['name'];
    // description = null;
    // externalLink = null;
    assetContract = AssetContract.fromJson(json['asset_contract']);
    // permalink = json['permalink'];
    // collection = Collection.fromJson(json['collection']);
    // decimals = null;
    // tokenMetadata = null;
    // owner = Owner.fromJson(json['owner']);
    // sellOrders = null;
    // creator = json['creator'] == null ? null: Creator.fromJson(json['creator']);
    traits = List.from(json['traits']).map((e)=>Traits.fromJson(e)).toList();
    // lastSale = null;
    // topBid = null;
    // listingDate = null;
    // isPresale = json['is_presale'];
    // transferFeePaymentToken = null;
    // transferFee = null;
    // tokenId = json['token_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['num_sales'] = numSales;
    _data['background_color'] = backgroundColor;
    _data['image_url'] = imageUrl;
    _data['image_preview_url'] = imagePreviewUrl;
    _data['image_thumbnail_url'] = imageThumbnailUrl;
    _data['image_original_url'] = imageOriginalUrl;
    _data['animation_url'] = animationUrl;
    _data['animation_original_url'] = animationOriginalUrl;
    _data['name'] = name;
    _data['description'] = description;
    _data['external_link'] = externalLink;
    _data['asset_contract'] = assetContract!.toJson();
    _data['permalink'] = permalink;
    _data['collection'] = collection!.toJson();
    _data['decimals'] = decimals;
    _data['token_metadata'] = tokenMetadata;
    _data['owner'] = owner!.toJson();
    _data['sell_orders'] = sellOrders;
    _data['creator'] = creator!.toJson();
    _data['traits'] = traits!.map((e)=>e!.toJson()).toList();
    _data['last_sale'] = lastSale;
    _data['top_bid'] = topBid;
    _data['listing_date'] = listingDate;
    _data['is_presale'] = isPresale;
    _data['transfer_fee_payment_token'] = transferFeePaymentToken;
    _data['transfer_fee'] = transferFee;
    _data['token_id'] = tokenId;
    return _data;
  }
}

class AssetContract {
  AssetContract({
    required this.address,
    required this.assetContractType,
    required this.createdDate,
    required this.name,
     this.nftVersion,
     this.openseaVersion,
    required this.owner,
    required this.schemaName,
    required this.symbol,
     this.totalSupply,
    required this.description,
     this.externalLink,
     this.imageUrl,
    required this.defaultToFiat,
    required this.devBuyerFeeBasisPoints,
    required this.devSellerFeeBasisPoints,
    required this.onlyProxiedTransfers,
    required this.openseaBuyerFeeBasisPoints,
    required this.openseaSellerFeeBasisPoints,
    required this.buyerFeeBasisPoints,
    required this.sellerFeeBasisPoints,
     this.payoutAddress,
  });
  late final String? address;
  late final String? assetContractType;
  late final String? createdDate;
  late final String? name;
  late final String? nftVersion;
  late final String? openseaVersion;
  late final int? owner;
  late final String? schemaName;
  late final String? symbol;
  late final String? totalSupply;
  late final String? description;
  late final String? externalLink;
  late final String? imageUrl;
  late final bool? defaultToFiat;
  late final int? devBuyerFeeBasisPoints;
  late final int? devSellerFeeBasisPoints;
  late final bool? onlyProxiedTransfers;
  late final int? openseaBuyerFeeBasisPoints;
  late final int? openseaSellerFeeBasisPoints;
  late final int? buyerFeeBasisPoints;
  late final int? sellerFeeBasisPoints;
  late final String? payoutAddress;
  
  AssetContract.fromJson(Map<String, dynamic> json){
    address = json['address'];
    assetContractType = json['asset_contract_type'];
    createdDate = json['created_date'];
    name = json['name'];
    nftVersion = null;
    openseaVersion = null;
    owner = json['owner'];
    schemaName = json['schema_name'];
    symbol = json['symbol'];
    totalSupply = null;
    description = json['description'];
    externalLink = null;
    imageUrl = null;
    defaultToFiat = json['default_to_fiat'];
    devBuyerFeeBasisPoints = json['dev_buyer_fee_basis_points'];
    devSellerFeeBasisPoints = json['dev_seller_fee_basis_points'];
    onlyProxiedTransfers = json['only_proxied_transfers'];
    openseaBuyerFeeBasisPoints = json['opensea_buyer_fee_basis_points'];
    openseaSellerFeeBasisPoints = json['opensea_seller_fee_basis_points'];
    buyerFeeBasisPoints = json['buyer_fee_basis_points'];
    sellerFeeBasisPoints = json['seller_fee_basis_points'];
    payoutAddress = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['asset_contract_type'] = assetContractType;
    _data['created_date'] = createdDate;
    _data['name'] = name;
    _data['nft_version'] = nftVersion;
    _data['opensea_version'] = openseaVersion;
    _data['owner'] = owner;
    _data['schema_name'] = schemaName;
    _data['symbol'] = symbol;
    _data['total_supply'] = totalSupply;
    _data['description'] = description;
    _data['external_link'] = externalLink;
    _data['image_url'] = imageUrl;
    _data['default_to_fiat'] = defaultToFiat;
    _data['dev_buyer_fee_basis_points'] = devBuyerFeeBasisPoints;
    _data['dev_seller_fee_basis_points'] = devSellerFeeBasisPoints;
    _data['only_proxied_transfers'] = onlyProxiedTransfers;
    _data['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
    _data['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
    _data['buyer_fee_basis_points'] = buyerFeeBasisPoints;
    _data['seller_fee_basis_points'] = sellerFeeBasisPoints;
    _data['payout_address'] = payoutAddress;
    return _data;
  }
}

class Collection {
  Collection({
    required this.bannerImageUrl,
     this.chatUrl,
    required this.createdDate,
    required this.defaultToFiat,
    required this.description,
    required this.devBuyerFeeBasisPoints,
    required this.devSellerFeeBasisPoints,
     this.discordUrl,
    required this.displayData,
     this.externalUrl,
    required this.featured,
     this.featuredImageUrl,
    required this.hidden,
    required this.safelistRequestStatus,
    required this.imageUrl,
    required this.isSubjectToWhitelist,
     this.largeImageUrl,
     this.mediumUsername,
    required this.name,
    required this.onlyProxiedTransfers,
    required this.openseaBuyerFeeBasisPoints,
    required this.openseaSellerFeeBasisPoints,
    required this.payoutAddress,
    required this.requireEmail,
     this.shortDescription,
    required this.slug,
     this.telegramUrl,
     this.twitterUsername,
     this.instagramUsername,
     this.wikiUrl,
  });
  late final String? bannerImageUrl;
  late final Null? chatUrl;
  late final String? createdDate;
  late final bool? defaultToFiat;
  late final String? description;
  late final String? devBuyerFeeBasisPoints;
  late final String? devSellerFeeBasisPoints;
  late final String? discordUrl;
  late final DisplayData? displayData;
  late final String? externalUrl;
  late final bool? featured;
  late final String? featuredImageUrl;
  late final bool? hidden;
  late final String? safelistRequestStatus;
  late final String? imageUrl;
  late final bool? isSubjectToWhitelist;
  late final String? largeImageUrl;
  late final Null? mediumUsername;
  late final String ?name;
  late final bool? onlyProxiedTransfers;
  late final String? openseaBuyerFeeBasisPoints;
  late final String? openseaSellerFeeBasisPoints;
  late final String? payoutAddress;
  late final bool requireEmail;
  late final Null shortDescription;
  late final String? slug;
  late final Null telegramUrl;
  late final Null twitterUsername;
  late final String? instagramUsername;
  late final Null wikiUrl;
  
  Collection.fromJson(Map<String, dynamic> json){
    bannerImageUrl = json['banner_image_url'];
    chatUrl = null;
    createdDate = json['created_date'];
    defaultToFiat = json['default_to_fiat'];
    description = json['description'];
    devBuyerFeeBasisPoints = json['dev_buyer_fee_basis_points'];
    devSellerFeeBasisPoints = json['dev_seller_fee_basis_points'];
    discordUrl = null;
    displayData = DisplayData.fromJson(json['display_data']);
    externalUrl = null;
    featured = json['featured'];
    featuredImageUrl = null;
    hidden = json['hidden'];
    safelistRequestStatus = json['safelist_request_status'];
    imageUrl = json['image_url'];
    isSubjectToWhitelist = json['is_subject_to_whitelist'];
    largeImageUrl = null;
    mediumUsername = null;
    name = json['name'];
    onlyProxiedTransfers = json['only_proxied_transfers'];
    openseaBuyerFeeBasisPoints = json['opensea_buyer_fee_basis_points'];
    openseaSellerFeeBasisPoints = json['opensea_seller_fee_basis_points'];
    payoutAddress = json['payout_address'];
    requireEmail = json['require_email'];
    shortDescription = null;
    slug = json['slug'];
    telegramUrl = null;
    twitterUsername = null;
    instagramUsername = null;
    wikiUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banner_image_url'] = bannerImageUrl;
    _data['chat_url'] = chatUrl;
    _data['created_date'] = createdDate;
    _data['default_to_fiat'] = defaultToFiat;
    _data['description'] = description;
    _data['dev_buyer_fee_basis_points'] = devBuyerFeeBasisPoints;
    _data['dev_seller_fee_basis_points'] = devSellerFeeBasisPoints;
    _data['discord_url'] = discordUrl;
    _data['display_data'] = displayData!.toJson();
    _data['external_url'] = externalUrl;
    _data['featured'] = featured;
    _data['featured_image_url'] = featuredImageUrl;
    _data['hidden'] = hidden;
    _data['safelist_request_status'] = safelistRequestStatus;
    _data['image_url'] = imageUrl;
    _data['is_subject_to_whitelist'] = isSubjectToWhitelist;
    _data['large_image_url'] = largeImageUrl;
    _data['medium_username'] = mediumUsername;
    _data['name'] = name;
    _data['only_proxied_transfers'] = onlyProxiedTransfers;
    _data['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
    _data['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
    _data['payout_address'] = payoutAddress;
    _data['require_email'] = requireEmail;
    _data['short_description'] = shortDescription;
    _data['slug'] = slug;
    _data['telegram_url'] = telegramUrl;
    _data['twitter_username'] = twitterUsername;
    _data['instagram_username'] = instagramUsername;
    _data['wiki_url'] = wikiUrl;
    return _data;
  }
}

class DisplayData {
  DisplayData({
    required this.cardDisplayStyle,
  });
  late final String cardDisplayStyle;
  
  DisplayData.fromJson(Map<String, dynamic> json){
    cardDisplayStyle = json['card_display_style'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['card_display_style'] = cardDisplayStyle;
    return _data;
  }
}

class Owner {
  Owner({
    required this.user,
    required this.profileImgUrl,
    required this.address,
    required this.config,
  });
  late final User? user;
  late final String profileImgUrl;
  late final String address;
  late final String config;
  
  Owner.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']==null?{}:json['user']);
    profileImgUrl = json['profile_img_url'];
    address = json['address'];
    config = json['config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.toJson();
    _data['profile_img_url'] = profileImgUrl;
    _data['address'] = address;
    _data['config'] = config;
    return _data;
  }
}

class User {
  User({
     this.username,
  });
  late final String? username;
  
  User.fromJson(Map<String, dynamic> json){
    username = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    return _data;
  }
}

class Creator {
  Creator({
    required this.user,
    required this.profileImgUrl,
    required this.address,
    required this.config,
  });
  late final User? user;
  late final String profileImgUrl;
  late final String address;
  late final String config;
  
  Creator.fromJson(Map<String, dynamic> json){
    user = json['user'] == null ? null: User.fromJson(json['user']);
    profileImgUrl = json['profile_img_url'];
    address = json['address'];
    config = json['config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.toJson();
    _data['profile_img_url'] = profileImgUrl;
    _data['address'] = address;
    _data['config'] = config;
    return _data;
  }
}

class Traits {
  Traits({
    required this.traitType,
    required this.value,
     this.displayType,
     this.maxValue,
    required this.traitCount,
     this.order,
  });
  late final String traitType;
  late final dynamic value;
  late final Null displayType;
  late final Null maxValue;
  late final int traitCount;
  late final Null order;
  
  Traits.fromJson(Map<String, dynamic> json){
    // traitType = json['trait_type'];
    // value = json['value'];
    // displayType = null;
    // maxValue = null;
    // traitCount = json['trait_count'];
    // order = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trait_type'] = traitType;
    _data['value'] = value;
    _data['display_type'] = displayType;
    _data['max_value'] = maxValue;
    _data['trait_count'] = traitCount;
    _data['order'] = order;
    return _data;
  }
}