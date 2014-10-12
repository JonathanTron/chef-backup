# Make notifications to be based on inline resources
use_inline_resources

action :install do
  pkg_name = URI.parse(new_resource.url).path.split("/").last
  pkg_path = "#{Chef::Config[:file_cache_path]}/#{pkg_name}"

  remote_file pkg_path do
    source new_resource.url
    mode "644"
    checksum new_resource.checksum
  end

  package "omnibus-backup" do
    source pkg_path
    provider Chef::Provider::Package::Dpkg
    action :install
  end
end

action :remove do
  package "omnibus-backup" do
    action :remove
  end
end
