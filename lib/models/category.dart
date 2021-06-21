class Category {
  final String? imageAddress;
  final String? name;
  final String? catImage;
  final String? categoryTag;
  final String? folderName;

  Category({
    this.imageAddress,
    this.name,
    this.catImage,
    this.categoryTag,
    this.folderName,
  });

  static List<Category> categories = <Category>[
    Category(
      imageAddress: "assets/images/home/database.png",
      name: "Database",
      catImage: "assets/images/category/database.png",
      categoryTag: 'database',
      folderName: '/database',
    ),
    Category(
      imageAddress: "assets/images/home/os.png",
      name: "Operating Systems",
      catImage: "assets/images/category/os.jpg",
      categoryTag: 'os',
      folderName: '/os',
    ),
    Category(
      imageAddress: "assets/images/home/networking.png",
      name: "Networking",
      catImage: "assets/images/category/networking.jpg",
      categoryTag: 'networking',
      folderName: '/networking',
    ),
    Category(
      imageAddress: "assets/images/home/software.png",
      name: "Softwares",
      catImage: "assets/images/category/software.jpg",
      categoryTag: 'software',
      folderName: '/software',
    ),
    Category(
      imageAddress: "assets/images/home/virus2.png",
      name: "Virus",
      catImage: "assets/images/category/virus.jpg",
      categoryTag: 'virus',
      folderName: '/virus',
    ),
  ];
}
