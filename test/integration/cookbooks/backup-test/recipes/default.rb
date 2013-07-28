include_recipe "backup"

backup_install node.name
backup_config node.name

# backup_model "etc" do
# end
