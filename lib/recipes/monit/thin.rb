namespace :thin do

  namespace :monit do
      
    desc <<-DESC
    Create monit configuration for thin.
    "Source":#{link_to_source(__FILE__)}
    DESC
    task :setup do

        # Settings
        fetch(:thin_servers)
        fetch(:thin_port)
        fetch_or_default(:thin_application, "thin_#{fetch(:application)}" )
        fetch_or_default(:thin_bin_path, "/usr/bin/thin")
        fetch_or_default(:thin_monit_memory, 60)
        fetch_or_default(:thin_config_file, "#{shared_path}/config/thin.yml")
        fetch_or_default(:monit_conf_dir, "/etc/monit.d")
        fetch_or_default(:thin_pid_dir, "#{shared_path}/pids")

        processes = []
        ports = (0...thin_servers).collect { |i| thin_port + i }
        ports.each do |port|

          pid_path = "#{thin_pid_dir}/thin.#{port}.pid"

          start_options = "-C #{thin_config_file}"
          stop_options = "-C #{thin_config_file}"

          processes << { :port => port, :start_options => start_options, :stop_options => stop_options, :name => thin_bin_path, :pid_path => pid_path }
        end

        set :processes, processes

        put template.load("thin/thin.monitrc.erb"), "/tmp/#{thin_application}.conf"
        sudo "install -o root /tmp/#{thin_application}.conf #{monit_conf_dir}/#{thin_application}.conf"
      end

      desc "Restart thin (for application)"
      task :restart do
        fetch_or_default(:monit_bin_path, "monit")
        fetch_or_default(:thin_application, Proc.new { "thin_#{fetch(:application)}" })
        sudo "#{monit_bin_path} -g #{thin_application} restart all"
      end

      desc "Start thin (for application)"
      task :start do
        fetch_or_default(:monit_bin_path, "monit")
        fetch_or_default(:thin_application, Proc.new { "thin_#{fetch(:application)}" })
        sudo "#{monit_bin_path} -g #{thin_application} start all" 
      end

      desc "Stop thin (for application)"
      task :stop do
        fetch_or_default(:monit_bin_path, "monit")
        fetch_or_default(:thin_application, Proc.new { "thin_#{fetch(:application)}" })
        sudo "#{monit_bin_path} -g #{thin_application} stop all" 
      end

  end 
end
