actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/3.11.0/omnibus-backup_3.11.0-1_amd64.deb"
attribute :checksum, kind_of: String, default: "f16b740c2b2408797f81d590124cc36791fb5908e798374c95cc34b6632dc18c"
