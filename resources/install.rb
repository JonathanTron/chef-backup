actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/4.4.0/omnibus-backup_4.4.0-1_amd64.deb"
attribute :checksum, kind_of: String, default: "3334aae0d1926244d1ef01155fd6dcfcbc0ffb68444d1a3761bb7341d7907eec"
