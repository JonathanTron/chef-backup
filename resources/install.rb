actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/3.11.0/omnibus-backup_3.11.0-1_amd64.deb"
attribute :checksum, kind_of: String, default: "679799db3ae06ceba2229ad12b966b3a7e68e5c78b8fe244fc17eaca3cf476e5"
