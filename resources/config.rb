actions :install, :remove
default_action :install

attribute :base_dir, kind_of: String, default: "/opt/backup"

attribute :utilities, kind_of: Hash, default: {
  gpg: "/opt/omnibus-backup/embedded/bin/gpg2",
  openssl: "/opt/omnibus-backup/embedded/bin/openssl"
}

attribute :logging_console_quiet, equal_to: [true, false], default: false
attribute :logging_logfile_enabled, equal_to: [true, false], default: true
attribute :logging_logfile_log_path, kind_of: String, default: "log"
attribute :logging_logfile_max_bytes, kind_of: Integer, default: 500_000
attribute :logging_syslog_enabled, equal_to: [true, false], default: false
attribute :logging_syslog_ident, kind_of: String, default: "backup"
attribute :logging_syslog_options, kind_of: String, default: "Syslog::LOG_PID"
attribute :logging_syslog_facility, kind_of: String, default: "Syslog::LOG_LOCAL0"
attribute :logging_syslog_info, kind_of: String, default: "Syslog::LOG_INFO"
attribute :logging_syslog_warn, kind_of: String, default: "Syslog::LOG_WARNING"
attribute :logging_syslog_error, kind_of: String, default: "Syslog::LOG_ERR"
attribute :encryptor_defaults, kind_of: Hash, default: {}
attribute :storage_defaults, kind_of: Hash, default: {}
attribute :notifier_defaults, kind_of: Hash, default: {}
