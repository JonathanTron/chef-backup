# Make notifications to be based on inline resources
use_inline_resources

action :install do
  ["keys", "models", "logs"].each do |dir|
    directory "#{new_resource.base_dir}/#{dir}" do
      action :create
      recursive true
    end
  end

  template "#{new_resource.base_dir}/config.rb" do
    cookbook "backup"
    source "config.rb.erb"
    mode "600"
    variables({
      utilities: new_resource.utilities,
      logging_console_quiet: new_resource.logging_console_quiet,
      logging_logfile_enabled: new_resource.logging_logfile_enabled,
      logging_logfile_log_path: new_resource.logging_logfile_log_path,
      logging_logfile_max_bytes: new_resource.logging_logfile_max_bytes,
      logging_syslog_enabled: new_resource.logging_syslog_enabled,
      logging_syslog_ident: new_resource.logging_syslog_ident,
      logging_syslog_options: new_resource.logging_syslog_options,
      logging_syslog_facility: new_resource.logging_syslog_facility,
      logging_syslog_info: new_resource.logging_syslog_info,
      logging_syslog_warn: new_resource.logging_syslog_warn,
      logging_syslog_error: new_resource.logging_syslog_error,
      encryptor_defaults: new_resource.encryptor_defaults,
    })
  end
end

action :remove do
  directory new_resource.base_dir do
    action :remove
    recursive true
  end
end
