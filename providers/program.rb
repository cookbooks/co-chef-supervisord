action :supervise do
  template "#{node['supervisord']['conf_dir']}/conf.d/#{new_resource.name}.conf" do
    source "include.conf.erb"
    cookbook "supervisord"
    owner "root"
    group "root"
    mode "0644"
    variables :inc => new_resource, :type => 'program'

    notifies :reload, resources(:service => "supervisor")
  end
end
