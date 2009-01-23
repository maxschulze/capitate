namespace :apache do

  desc "Reload apache configuration"
  task :reload, :roles => :app do
    sudo "/etc/init.d/apache2 reload"
  end

  namespace :vhost do

    desc "Enable vhost"
    task_arg(:application, "Application Name", :default => Proc.new{ fetch(:application)})
    task :enable, :roles => :app do
      sudo "/usr/sbin/a2ensite #{application}.conf"
      apache.reload
    end

    desc "Disable vhost"
    task_arg(:application, "Application Name", :default => Proc.new{ fetch(:application)})
    task :disable, :roles => :app do
      sudo "/usr/sbin/a2dissite #{application}.conf"
      apache.reload
    end

    desc "Create (and upload) an apache vhost configuration for this application"
    task_arg(:domain, "Application domain")
    task_arg(:domain_aliases, "Domain Aliases", :default => [])
    task_arg(:current_path, "Current Path", :default => Proc.new{ fetch(:current_path)})
    task_arg(:application, "Application Name", :default => Proc.new{ fetch(:application)})
    task :setup, :roles => :app do
      fetch(:mongrel_size)
      fetch(:mongrel_port)

      set :public_path, "#{current_path}/public"
      set :cluster_name, "#{application}_cluster"

      mongrel_instances = []
      ports = (0...mongrel_size).collect { |i| mongrel_port + i }
      ports.each { |port| mongrel_instances << "127.0.0.1:#{port}" }

      set :mongrel_instances, mongrel_instances
      set :server_alias, domain_aliases.empty? ? nil : "ServerAlias #{domain_aliases.join(' ')}"

      put template.load("apache/vhost.mongrel_cluster.conf.erb"), "/tmp/#{application}.vhost.conf"
      sudo "mv /tmp/#{application}.vhost.conf /etc/apache2/sites-available/#{application}.conf"
    end
  end
end
