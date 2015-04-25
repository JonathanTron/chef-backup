include_recipe "backup"

if node["virtualization"] && node["virtualization"]["system"]=="docker"
  package "cron"
end

backup_install node.name
backup_config node.name

backup_model "configuration_backup" do
  description "configurations local backup"

  hour "2"
  minute "30"
  mailto "jonathan@openhood.com"

  split_into_chunks_of 250
  archives({
    "etc" => {
      :add => ["/etc"],
      :exclude => ["/etc/passwd"],
    },
    "backup" => {
      :add => ["/opt/backup/config.rb"],
    },
  })
  compress_with({
    :kind => "Bzip2",
    :options => {
      :level => 7,
    }
  })
  encrypt_with({
    :kind => "OpenSSL",
    :options => {
      :password => "a small password for testing",
      :base64 => true,
      :salt => true,
    }
  })
  store_with([
    {
      :kind => "Local",
      :options => {
        :path => "/var/backup",
        :keep => 5,
      }
    }
  ])

  action [:install, :enable]
end
