actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/3.7.0/omnibus-backup_3.7.0.20130725212503-1.ubuntu.12.04_amd64.deb"
attribute :checksum, kind_of: String, default: "17b092ed7b126c4db2cc47b30091aaa3b503c25481c5b1e5b22f26e7a851c497"
