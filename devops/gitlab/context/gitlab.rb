external_url ENV['GITLAB_DOMAIN_NAME'] || 'http://gitlab.devops.top'

# root password
gitlab_rails['initial_root_password'] = File.read('/run/secrets/admin_password').gsub("\n", "")

gitlab_rails['gitlab_shell_ssh_port'] = ENV['GITLAB_HOST_SSH_PORT'] || '22'

# Time zone
gitlab_rails['time_zone'] = 'Asia/Shanghai'

# Gravatar Settings
gitlab_rails['gravatar_plain_url'] = 'http://cdn.libravatar.org/avatar/%{hash}?s=%{size}&d=identicon'

gitlab_rails['trusted_proxies'] = ['caddy','nginx','apache2']

# Use external redis
redis['enable'] = false
gitlab_rails['redis_host'] = ENV['GITLAB_REDIS_HOST'] || 'redis'
gitlab_rails['redis_database'] = ENV['GITLAB_REDIS_DATABASE'] || 0
gitlab_rails['redis_port'] = ENV['GITLAB_REDIS_PORT'] || 6379
gitlab_rails['redis_password'] = ENV['GITLAB_REDIS_PASSWORD'] || '123456'

# Use external postgres
postgresql['enable'] = false
postgresql['shared_buffers'] = "2048MB"
gitlab_rails['db_host'] = ENV['GITLAB_POSTGRES_HOST'] || 'postgres'
gitlab_rails['db_database'] = ENV['GITLAB_POSTGRES_DB'] || 'gitlab'
gitlab_rails['db_username'] = ENV['GITLAB_POSTGRES_USER'] || 'gitlab'
gitlab_rails['db_password'] = ENV['GITLAB_POSTGRES_PASSWORD'] || 'gitlabPass'

# nginx
nginx['listen_https'] = false
nginx['listen_port'] = 80
nginx['custom_gitlab_server_config'] = "set_real_ip_from 172.0.0.0/8;\nreal_ip_header X-Real-IP;\nreal_ip_recursive on;"
nginx['client_max_body_size'] = '1024m'

# Memory and process optimization
puma['worker_processes'] = 4

# Add any other gitlab.rb configuration here, each on its own line
