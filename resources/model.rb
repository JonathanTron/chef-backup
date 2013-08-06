actions :install, :enable, :disable, :remove
default_action [:install, :enable]

attribute :name, kind_of: String, name_attribute: true
attribute :description, kind_of: String, default: nil
attribute :base_dir, kind_of: String, default: "/opt/backup"

attribute :hour, kind_of: String, default: "1"
attribute :minute, kind_of: String, default: "*"
attribute :day, kind_of: String, default: "*"
attribute :month, kind_of: String, default: "*"
attribute :weekday, kind_of: String, default: "*"
attribute :mailto, kind_of: String, default: nil

attribute :split_into_chunks_of, kind_of: [NilClass, Integer], default: nil
attribute :archives, kind_of: Hash, default: {}
attribute :databases, kind_of: Array, default: []
attribute :databases, kind_of: Array, default: []
attribute :compress_with, kind_of: [Hash, NilClass], default: {kind: "Gzip"}
attribute :encrypt_with, kind_of: [Hash, NilClass], default: nil
attribute :store_with, kind_of: Array, default: []
attribute :notify_by, kind_of: Array, default: []
