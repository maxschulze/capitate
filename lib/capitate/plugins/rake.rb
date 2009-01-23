module Capitate::Plugins::Rake

  # Execute rake tasks.
  #
  # ==== Options
  # +tasks+:: List of task names, or a single task
  #
  # ==== Examples (in capistrano task)
  #   rake.run("db:migrate")
  #   rake.run([ "db:create", "db:migrate" ])
  #   rake.run("db:bootstrap AUTO_ACCEPT=true")
  #
  def run(tasks)
    # If a single object, wrap in array
    tasks = [ tasks ] unless tasks.is_a?(Array)

    # Install one at a time because we may need to pass install args (e.g. AUTO_ACCEPT=true)
    tasks.each do |task|
      run_via "/usr/bin/env rake RAILS_ENV=#{rails_env} #{task}"
    end
  end

end

Capistrano.plugin :rake, Capitate::Plugins::Rake
