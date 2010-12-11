namespace :thin do
  
  desc <<-DESC
Create Thin config yaml in shared path.
"Source":#{link_to_source(__FILE__)}
DESC
  task_arg(:thin_user, "Thin User")
  task_arg(:thin_group, "Thin Group")
  task_arg(:thin_swiftiply_key, "Thin Swiftiply Key", :default => '')
  task_arg(:thin_stats_path, "Thin stats path", :default => '')
  task_arg(:thin_pid, "Thin PID location", :default => Proc.new {"#{shared_path}/pids/thin.pid"}, :default_desc => "\#{shared_path}/pids/thin.pid")
  task_arg(:thin_log, "Thin Log location", :default => Proc.new {"#{shared_path}/log/thin.log"}, :default_desc => "\#{shared_path}/log/thin.log")
  task_arg(:thin_max_conns, "Max Connections", :default => 1024)
  task_arg(:thin_timeout, "Timeout", :default => 30)
  task_arg(:thin_port, "Thin Port", :default => 3000)
  task_arg(:thin_environment, "Environment", :default => :rails_env)
  task_arg(:thin_max_persistent_conns, "Max Persisten Connections", :default => 512)
  task_arg(:thin_directory, "Directory", :default => Proc.new {"#{current_path}"}, :default_desc => "\#{current_path}")
  task_arg(:thin_servers, "Number of servers", :default => 1)
  task_arg(:thin_daemonize, "Daemonize", :default => true)
  task_arg(:thin_address, "Address", :default => '0.0.0.0')
  task_arg(:thin_yml_template, "Thin yml template", :default => "rails/thin.yml.erb")
  task_arg(:thin_options, "Config options appended to thin yml", :default => {})

  task :setup, :roles => :app do
    
    unless thin_user.blank?
      thin_options["user"] = thin_user
    end

    unless thin_group.blank?
      thin_options["group"] = thin_group
    end

    unless thin_swiftiply_key.blank?
      thin_options["swiftiply"] = thin_swiftiply_key
    end

    unless thin_stats_path.blank?
      thin_options["stats"] = thin_stats_path
    end

    run "mkdir -p #{shared_path}/config"
    put template.load(thin_yml_template), "#{shared_path}/config/thin.yml"
  end
 
  desc "Make symlink for thin yaml"
  task :update_code do
    run "ln -nfs #{shared_path}/config/thin.yml #{release_path}/config/thin.yml"
  end
end
