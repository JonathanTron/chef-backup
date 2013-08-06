# Make notifications to be based on inline resources
use_inline_resources

action :install do
  template "#{new_resource.base_dir}/models/#{new_resource.name}.rb" do
    mode "600"
    source "model.rb.erb"
    cookbook "backup"
    variables({
      :name => new_resource.name,
      :description => new_resource.description,
      :base_dir => new_resource.base_dir,
      :split_into_chunks_of => new_resource.split_into_chunks_of,
      :archives => new_resource.archives,
      :databases => new_resource.databases,
      :compress_with => new_resource.compress_with,
      :encrypt_with => new_resource.encrypt_with,
      :store_with => new_resource.store_with,
      :notify_by => new_resource.notify_by,
    })
  end
end

action :enable do
  cron "backup job: #{new_resource.name}" do
    hour new_resource.hour || "1"
    minute new_resource.minute || "*"
    day new_resource.day || "*"
    month new_resource.month || "*"
    weekday new_resource.weekday || "*"
    mailto new_resource.mailto
    command "/opt/omnibus-backup/bin/backup perform -t #{new_resource.name} -c #{new_resource.base_dir}/config.rb"
    action :create
  end
end

action :disable do
  cron "backup job: #{new_resource.name}" do
    action :delete
  end
end

action :remove do
  cron "backup job: #{new_resource.name}" do
    action :delete
  end
  file "#{new_resource.base_dir}/models/#{new_resource.name}.rb" do
    action :delete
  end
end
