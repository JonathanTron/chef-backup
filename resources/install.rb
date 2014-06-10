actions :install, :remove
default_action :install

attribute :url, kind_of: String, default: "https://github.com/JonathanTron/omnibus-backup/releases/download/3.10.0/omnibus-backup_3.10.0.20140610122512-1_amd64.deb"
attribute :checksum, kind_of: String, default: "57db8aac2200b5ba01f92d5d93bbc211c5f898538cb026f7430bca8c97710b68"
