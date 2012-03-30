# Data bags for programs:
# This is a list of data bag items that will be queried to 
# configure [program:x] sections
set[:supervisord][:data_bag_items] = []
set[:supervisord][:conf_dir] = '/etc/supervisor'

# global supervisord settings
set[:supervisord][:globals][:logfile] = '/var/log/supervisor/supervisord.log'
set[:supervisord][:globals][:pidfile] = '/var/run/supervisord.pid'
set[:supervisord][:globals][:childlogdir] = '/var/log/supervisor'
set[:supervisord][:globals][:logfile_maxbytes] = nil
set[:supervisord][:globals][:logfile_backups] = nil
set[:supervisord][:globals][:loglevel] = nil
set[:supervisord][:globals][:nodaemon] = nil
set[:supervisord][:globals][:minfds] = nil
set[:supervisord][:globals][:minprocs] = nil
set[:supervisord][:globals][:umask] = nil
set[:supervisord][:globals][:user] = nil
set[:supervisord][:globals][:identifier] = nil
set[:supervisord][:globals][:directory] = nil
set[:supervisord][:globals][:nocleanup] = nil
set[:supervisord][:globals][:strip_ansi] = nil
set[:supervisord][:globals][:environment] = nil

# unix_http_server section
set[:supervisord][:unix_http_server][:file] = '/var/run/supervisor.sock'
set[:supervisord][:unix_http_server][:chmod] = '0700'
set[:supervisord][:unix_http_server][:chown] = nil
set[:supervisord][:unix_http_server][:username] = nil
set[:supervisord][:unix_http_server][:password] = nil

# inet_http_server section
set[:supervisord][:inet_http_server][:port] = nil
set[:supervisord][:inet_http_server][:username] = nil
set[:supervisord][:inet_http_server][:password] = nil

# supervisorct section
set[:supervisord][:supervisorctl][:serverurl] = 'unix:///var/run/supervisor.sock'
set[:supervisord][:supervisorctl][:username] = nil
set[:supervisord][:supervisorctl][:password] = nil
set[:supervisord][:supervisorctl][:prompt] = nil
set[:supervisord][:supervisorctl][:history_file] = nil
