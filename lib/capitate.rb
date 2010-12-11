require 'rubygems'
require 'active_support'
require 'highline'
require 'capistrano'

HighLine.track_eof = false

# Add this path to ruby load path
$:.unshift File.dirname(__FILE__)

module Capitate # :nodoc:
 module Plugins # :nodoc:
 end
end

require 'capitate/plugins/base'
require 'capitate/plugins/gem'
require 'capitate/plugins/build'
require 'capitate/plugins/utils'
require 'capitate/plugins/script'
require 'capitate/plugins/prompt'
require 'capitate/plugins/templates'
require 'capitate/plugins/yum'
require 'capitate/plugins/rake'

# Extensions + Patches
require "capitate/cap_ext/connections"
require "capitate/cap_ext/variables"
require "capitate/cap_ext/run_via"
require "capitate/cap_ext/docs"
require "capitate/cap_ext/namespace"
require "capitate/cap_ext/task_definition"

class Capistrano::Configuration
  include Capitate::CapExt::Variables
  include Capitate::CapExt::RunVia
  include Capitate::CapExt::Connections
  include Capitate::CapExt::Docs
end

class Capistrano::TaskDefinition
  include Capitate::CapExt::TaskDefinition
end

class Capistrano::Configuration::Namespaces::Namespace
  include Capitate::CapExt::Namespace
end

module Capistrano::Configuration::Namespaces
  include Capitate::CapExt::Namespace
end

#module Capistrano::Configuration::Connections; end

require 'capitate/task_node'

