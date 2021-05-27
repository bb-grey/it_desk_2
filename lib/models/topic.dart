class Topic {
  final String? title;
  final String? category;
  final String? assetPath;
  final DateTime? postDate;

  Topic({this.title, this.category, this.assetPath, this.postDate});

  static List<Topic> getTopics() {
    return <Topic>[
      Topic(
        title: 'How to install SQL server on MAC?',
        category: 'database',
        assetPath:
            'assets/topics/database/How_to_install_SQL_Server_on_a_Mac.pdf',
        postDate: DateTime(2020, 12, 19),
      ),
      Topic(
        title: 'How to install SQL server?',
        category: 'database',
        assetPath: 'assets/topics/database/How_to_Install_SQL_Server.pdf',
        postDate: DateTime(2020, 12, 22),
      ),
      Topic(
        title: 'How to create a VPN server on a MAC?',
        category: 'networking',
        assetPath:
            'assets/topics/networking/Creating_a_VPN_Server_on_a_Mac.pdf',
        postDate: DateTime(2020, 12, 23),
      ),
      Topic(
        title: 'How to create a VPN server on Windows 10?',
        category: 'networking',
        assetPath:
            'assets/topics/networking/Creating_a_VPN_Server_on_Windows_10.pdf',
        postDate: DateTime(2020, 12, 25),
      ),
      Topic(
        title: 'How to install windows?',
        category: 'os',
        assetPath: 'assets/topics/os/How_to_install_window.pdf',
        postDate: DateTime(2020, 12, 26),
      ),
      Topic(
        title: 'How to boot windows?',
        category: 'os',
        assetPath: 'assets/topics/os/How_to_boot_window.pdf',
        postDate: DateTime(2020, 12, 28),
      ),
      Topic(
        title: 'Hot to create an account on GitHub?',
        category: 'software',
        assetPath:
            'assets/topics/software/How_to_Create_an_Account_on_GitHub.pdf',
        postDate: DateTime(2020, 12, 29),
      ),
      Topic(
        title: 'How to remove any temporary files?',
        category: 'virus',
        assetPath: 'assets/topics/virus/Remove_any_temporary_files.pdf',
        postDate: DateTime(2021, 1, 3),
      ),
      Topic(
        title: 'How to scan the system for viruses?',
        category: 'virus',
        assetPath: 'assets/topics/virus/Scan_the_system_for_viruses.pdf',
        postDate: DateTime(2021, 1, 5),
      ),
    ];
  }
}
