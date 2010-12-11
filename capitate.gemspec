Gem::Specification.new do |s|
  s.name = %q{capitate}
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabriel Handford"]
  s.date = %q{2009-01-23}
  s.description = %q{Capistrano recipes, plugins and templates.}
  s.email = ["gabrielh@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.md"]
  s.files = ["Capfile", "History.txt", "License.txt", "Manifest.txt", "README.md", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/capitate.rb", "lib/capitate/cap_ext/connections.rb", "lib/capitate/cap_ext/docs.rb", "lib/capitate/cap_ext/namespace.rb", "lib/capitate/cap_ext/run_via.rb", "lib/capitate/cap_ext/task_definition.rb", "lib/capitate/cap_ext/variables.rb", "lib/capitate/plugins/base.rb", "lib/capitate/plugins/build.rb", "lib/capitate/plugins/gem.rb", "lib/capitate/plugins/rake.rb", "lib/capitate/plugins/prompt.rb", "lib/capitate/plugins/script.rb", "lib/capitate/plugins/templates.rb", "lib/capitate/plugins/utils.rb", "lib/capitate/plugins/yum.rb", "lib/capitate/recipes.rb", "lib/capitate/task_node.rb", "lib/capitate/version.rb", "lib/deployment/centos-5.1-64-web/install.rb", "lib/recipes/active_record.rb", "lib/recipes/apache.rb", "lib/recipes/backgroundrb.rb", "lib/recipes/centos/backgroundjob.rb", "lib/recipes/centos/backgroundrb.rb", "lib/recipes/centos/centos.rb", "lib/recipes/centos/imagemagick.rb", "lib/recipes/centos/memcached.rb", "lib/recipes/centos/merb.rb", "lib/recipes/centos/mongrel_cluster.rb", "lib/recipes/centos/monit.rb", "lib/recipes/centos/mysql.rb", "lib/recipes/centos/nginx.rb", "lib/recipes/centos/ruby.rb", "lib/recipes/centos/sphinx.rb", "lib/recipes/docs.rb", "lib/recipes/logrotate/backgroundjob.rb", "lib/recipes/logrotate/backgroundrb.rb", "lib/recipes/logrotate/merb.rb", "lib/recipes/logrotate/mongrel_cluster.rb", "lib/recipes/logrotate/monit.rb", "lib/recipes/logrotate/mysql.rb", "lib/recipes/logrotate/nginx.rb", "lib/recipes/logrotate/rails.rb", "lib/recipes/logrotate/sphinx.rb", "lib/recipes/logrotated.rb", "lib/recipes/memcached.rb", "lib/recipes/merb.rb", "lib/recipes/monit.rb", "lib/recipes/monit/backgroundjob.rb", "lib/recipes/monit/backgroundrb.rb", "lib/recipes/monit/database.rb", "lib/recipes/monit/memcached.rb", "lib/recipes/monit/merb.rb", "lib/recipes/monit/mongrel_cluster.rb", "lib/recipes/monit/mysql.rb", "lib/recipes/monit/nginx.rb", "lib/recipes/monit/sphinx.rb", "lib/recipes/monit/sshd.rb", "lib/recipes/mysql.rb", "lib/recipes/nginx.rb", "lib/recipes/rails.rb", "lib/recipes/redmine.rb", "lib/recipes/sphinx.rb", "lib/recipes/sshd.rb", "lib/recipes/syslogd.rb", "lib/templates/apache/vhost.mongrel_cluster.conf.erb", "lib/templates/backgroundjob/backgroundjob.initd.centos.erb", "lib/templates/backgroundjob/backgroundjob.monitrc.erb", "lib/templates/backgroundrb/backgroundrb.initd.centos.erb", "lib/templates/backgroundrb/backgroundrb.monitrc.erb", "lib/templates/backgroundrb/backgroundrb.yml.erb", "lib/templates/capistrano/Capfile", "lib/templates/logrotated/conf.erb", "lib/templates/memcached/memcached.initd.centos.erb", "lib/templates/memcached/memcached.monitrc.erb", "lib/templates/memcached/memcached.yml.erb", "lib/templates/merb/merb-no-http.monitrc.erb", "lib/templates/merb/merb.initd.centos.erb", "lib/templates/merb/merb.monitrc.erb", "lib/templates/mongrel/mongrel_cluster.initd.centos.erb", "lib/templates/mongrel/mongrel_cluster.monitrc.erb", "lib/templates/mongrel/mongrel_cluster.yml.erb", "lib/templates/monit/monit.cnf", "lib/templates/monit/monit.initd.centos.erb", "lib/templates/monit/monitrc.erb", "lib/templates/mysql/install_db.sql.erb", "lib/templates/mysql/my.cnf.innodb_1024.erb", "lib/templates/mysql/my.cnf.innodb_512.erb", "lib/templates/mysql/mysql.monitrc.erb", "lib/templates/nginx/nginx.conf.erb", "lib/templates/nginx/nginx.initd.centos.erb", "lib/templates/nginx/nginx.monitrc.erb", "lib/templates/nginx/nginx_vhost.conf.erb", "lib/templates/nginx/nginx_vhost_generic.conf.erb", "lib/templates/rails/database.yml.erb", "lib/templates/redmine/email.yml.erb", "lib/templates/ruby/fix_openssl.sh", "lib/templates/sphinx/sphinx.conf.erb", "lib/templates/sphinx/sphinx.monitrc.erb", "lib/templates/sphinx/sphinx_app.initd.centos.erb", "lib/templates/sshd/sshd.monitrc.erb", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_helper.rb", "test/test_plugin_upload.rb", "test/test_recipes.rb", "test/test_templates.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://capitate.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{capitate}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Capistrano recipes, plugins and templates.}
  s.test_files = ["test/test_helper.rb", "test/test_plugin_upload.rb", "test/test_recipes.rb", "test/test_templates.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 2.1.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<capistrano>, [">= 2.1.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 2.1.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
