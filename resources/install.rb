actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/4.1.10/omnibus-backup_4.1.10-1_amd64.deb"
attribute :checksum, kind_of: String, default: "530b6a27bec348875eaf0a586c2902e0a411ddfc20ce0aeb1460b7b8e835bf1a"
