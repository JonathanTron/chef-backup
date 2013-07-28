### Description

Provide LWRP to install and use Backup gem

### Requirements

#### platforms

- `ubuntu` - backup has only been tested on ubuntu

### Attributes

### Resources/Providers

#### backup_install

Install backup via (omnibus-backup)[https://github.com/JonathanTron/omnibus-backup]
package. `omnibus-backup` installs a self-contained Backup gem with all the
required dependencies: `ruby 1.9.3-p448`, `gnupg2`, `openssl`, etc.

The package installs everything to `/opt/omnibus-backup`.

Actions:

* `install` - installs omnibus-backup package
* `remove` - remove omnibus-backup package

Attributes parameters:

* `url` - String - specify URL of omnibus-backup package to install - default to `https://github.com/JonathanTron/omnibus-backup/releases/download/3.7.0/omnibus-backup_3.7.0.20130725212503-1.ubuntu.12.04_amd64.deb`
* `checksum` - String - SHA256 checksum for omnibus-backup package - default to `17b092ed7b126c4db2cc47b30091aaa3b503c25481c5b1e5b22f26e7a851c497`

#### backup_config

Generate/Install backup config file.

Actions:

* `install` - generate a backup model file
* `remove` - remove the cron task and file corresponding to the backup model

Attributes parameters:

* `base_dir` - String - path to base directory for backup models - default to `/opt/backup`
* `logging_console_quiet` - Boolean - configure `console_quiet` option - default to `false`
* `logging_logfile_enabled` - Boolean - configure `logfile.enabled` option - default to `true`
* `logging_logfile_log_path` - String - configure `logfile.logpath` option - default to `log`
* `logging_logfile_max_bytes` - Integer - configure `logfile.max_bytes` option - default to `500_000`
* `logging_syslog_enabled` - Boolean - configure `syslog.enabled` option - default to `false`
* `logging_syslog_ident` - String - configure `syslog.ident` option - default to `backup`
* `logging_syslog_options` - String - configure `syslog.options` option - default to `Syslog::LOG_PID`
* `logging_syslog_facility` - String - configure `syslog.facility` option - default to `Syslog::LOG_LOCAL0`
* `logging_syslog_info` - String - configure `syslog.info` option - default to `Syslog::LOG_INFO`
* `logging_syslog_warn` - String - configure `syslog.warn` option - default to `Syslog::LOG_WARNING`
* `logging_syslog_error` - String - configure `syslog.error` option - default to `Syslog::LOG_ERR`
* `utilities` - Hash - configure `Backup::Utilities` option -
  default to `{gpg: "/opt/omnibus-backup/embedded/bin/gpg2", openssl: "/opt/omnibus-backup/embedded/bin/openssl"}`
* `encryptor_defaults` - Hash - configure encryptor defaults (eg: `{"OpenSSL": {}}`).
  see [Backup Encryptors wiki](https://github.com/meskyanichi/backup/wiki/Encryptors)
  for more information. - default to `{}`

#### backup_model

Generate/Install a backup model.

Actions:

* `install` - generate a backup model file
* `enable` - activate a cron task to run the backup model
* `disable` - remove the cron task corresponding to the backup model
* `remove` - remove the cron task and file corresponding to the backup model

Attributes parameters:

* `name` - String - name to use in backup model - default to resource name
* `description` - String - description to use in backup model - default to `nil`
* `split_into_chunks_of` - Integer - specify value for `split_into_chunks_of` in `MB`
  set to nil to disable or an `Integer` (eg: `250`) to enable - default to `nil`
* `archives` - Hash - hash of archives sections to generate, (eg:
  `ruby[{"etc_files" => {use_sudo: true, add: ["/etc"], exclude: ["/etc/passwd"]}}`)
  see [Backup Archives wiki](https://github.com/meskyanichi/backup/wiki/Archives)
  for more information - default to `{}`
* `databases` - Array - list of databases sections to generate (eg:
  `[{kind: "PostgreSQL", options: {name: "my_db", host: "localhost", skip_tables: ["demo"], additional_options: ["-x"]}}]`)
  see [Backup Databases wiki](https://github.com/meskyanichi/backup/wiki/Databases)
  for more information - default to `[]`
* `compress_with` - Hash - configure compressor to use, set to nil to disable it (eg:
  `{kind: "Bzip2", level: 9}`). See [Backup Compressors wiki](https://github.com/meskyanichi/backup/wiki/Compressors)
  for more information. - default to `{kind: "Gzip"}`
* `encrypt_with` - Hash - configure encryptor to use, set to nil to disable it (eg:
  `{kind: "OpenSSL", password: "xxxXXX", base64: true, salt: true}`). See
  [Backup Encryptors wiki](https://github.com/meskyanichi/backup/wiki/Encryptors)
  for more information. - default to `nil`
* `store_with` - Array - List of storage sections to generate (eg:
  `[{kind: "S3", access_key_id: "my_key", "secret_access_key": "secret_key", region: "us-east-1", bucket: "my_bucket", keep: 30}]`).
  See [Backup Storages wiki](https://github.com/meskyanichi/backup/wiki/Storages)
  for more information. - default to `[]`
* `notify_by` - Array - List of notification section to generate (eg:
  `[{kind: "Mail", "on_success": false, from: "me@example.com", to: "me@example.com"}]`).
  See [Backup Notifiers wiki](https://github.com/meskyanichi/backup/wiki/Notifiers)
  for more information. - default to `[]`

### Usage

### License and Author

Author:: Jonathan Tron (<jonathan@openhood.com>)

Copyright 2013, Openhood S.E.N.C.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
