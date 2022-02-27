class Category {
  String name;
  String image;
  String? id;
  String? serverImage;
  Category(this.name, this.image, {this.id,this.serverImage});
}

List<Category> categories() => [
      Category('Food & Drinks', 'food'),
      Category('Media', 'media'),
      Category('18+ Items ', 'smileys'),
      Category('Mother/ Baby', 'people'),
      Category('Beauty/ Extensions', 'hand'),
      Category('Fashion/Accessories ', 'fashion'),
      Category('Creative/Geeks ', 'geek'),
      Category('Transport /Logistics ', 'travel'),
      Category('General Request ', 'view'),
      Category('Financial services', 'money'),
      Category('Entertainment', 'entertain'),
      Category('Virtual Product', 'web'),
      Category('Energy', 'bulb'),
      Category('Automobile', 'auto'),
      Category('Household Supplies', 'home'),
      Category('Heavy Equipment', 'stone'),
      Category('Security/Defence ', 'key'),
      Category('Spiritual', 'church'),
      Category('Repairs Services ', 'repairs'),
      Category('Manufacturing', 'bolt'),
      Category('Oil & Gas', 'fuel'),
      Category('Gov/Political', 'vote'),
      Category('Legal Services', 'legal'),
      Category('Health Care', 'health'),
      Category('Gadgets', 'laptop'),
      Category('Home/Garden', 'home'),
      Category('Office Supplies', 'pin'),
      Category('Construction', 'tola'),
      Category('Books', 'iwe'),
      Category('Relationship', 'love'),
      Category('Art/Artifacts', 'pic'),
      Category('Events/Party', 'celebrate'),
      Category('Handymen', 'tools'),
      Category('Animal/ Pets', 'pets'),
      Category('Real Estate', 'estate'),
      Category('Employment', 'dart'),
      Category('Travel/ Tour', 'globe'),
      Category('Education', 'grad'),
      Category('Sports', 'cup')
    ];
