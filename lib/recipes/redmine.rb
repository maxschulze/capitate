namespace :redmine do

  desc "Create necesary symlinks"
  task :create_symlinks, :roles => :app do
    # The redmine repository host a files directory, so I delete it
    run "rm -rf #{release_path}/files"
    run "ln -nfs #{shared_path}/files #{release_path}/files"
    active_record.update_code
    redmine.email.update_code
  end

  namespace :db do
    desc "Execute plugin migrations"
    task :migrate_plugins, :roles => :db do
      rake.run("db:migrate_plugins")
    end
  end

  namespace :email do
    desc "Create Redmine email configuration."
    task_arg(:mailserver_address, "Mailserver", :default => "localhost")
    task_arg(:mailserver_port, "Mailserver port", :default => 25)
    task_arg(:mail_domain, "Mail domain", :default => "example.com")
    task_arg(:email_authentication, "Mailserver authentication method", :default => :plain)
    task_arg(:mailserver_username, "Mailserver username", :default => "username")
    task_arg(:mailserver_password, "Mailserver password", :default => "password")
    task_arg(:mailserver_use_tls, "Mailserver use tls?", :default => false)
    task :setup, :roles => :app do
      run "mkdir -p #{shared_path}/config"
      put template.load("redmine/email.yml.erb"), "#{shared_path}/config/email.yml"
    end

    desc "Make symlink for config/email.yml"
    task :update_code, :roles => :app do
      run "ln -nfs #{shared_path}/config/email.yml #{release_path}/config/email.yml"
    end
  end
end
