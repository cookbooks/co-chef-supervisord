#
# Cookbook Name:: supervisord
# Recipe:: default
#
# Copyright 2011, Atalanta Systems Ltd
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
#

package "supervisor" do
  action :install
end

template "#{node["supervisord"]["conf_dir"]}/supervisord.conf" do
  source "supervisord.conf.erb"
  mode "0644"
  owner "root"
  group "root"
  # Check to make sure each "section" of the config has actual values before we 
  # pass them off to the template; yeah, this is kind of ugly :(
  variables(
    :globals => (node["supervisord"]["globals"] \
      unless (node["supervisord"]["globals"].map { |k,v| not v.nil? }\
        .select {|a| a}.empty?)),
    :unix_http_server => (node["supervisord"]["unix_http_server"] \
      unless (node["supervisord"]["unix_http_server"].map { |k,v| not v.nil? }\
        .select {|a| a}.empty?)),
    :inet_http_server => (node["supervisord"]["inet_http_server"] \
      unless (node["supervisord"]["inet_http_server"].map { |k,v| not v.nil? }\
        .select {|a| a}.empty?)),
    :supervisorctl => (node["supervisord"]["supervisorctl"] \
      unless (node["supervisord"]["supervisorctl"].map { |k,v| not v.nil? }\
        .select {|a| a}.empty?))
  )
end

service "supervisor" do
  supports :status => true, :restart => false, :reload => true
  reload_command "supervisorctl update"
  action [:enable, :start]
end
