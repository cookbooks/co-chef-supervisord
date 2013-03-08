#
# Cookbook Name:: supervisord
# Recipe:: includes
#
# Copyright 2012, ... TODO
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

includes = []
groups = []
node['supervisord']['data_bag_items'].each do |id|
  search(:supervisord, "id:#{id}") do |inc|
    includes << inc
  end
end

includes.each do |inc|
  template "#{node['supervisord']['conf_dir']}/conf.d/#{inc[:id]}.conf" do
    source "include.conf.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
      :inc => inc,
      :include_type => inc.fetch('include_type', 'program')
    )
  end
end
