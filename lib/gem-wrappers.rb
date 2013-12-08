require 'gem-wrappers/environment'
require 'gem-wrappers/installer'

module GemWrappers

  def self.install(specs)
    environment = GemWrappers::Environment.new
    environment.ensure
    wrappers = GemWrappers::Installer.new(environment.file)
    wrappers.ensure
    specs.each do |spec|
      spec.executables.each do |executable|
        wrappers.install(executable)
      end
    end
    %w{ruby gem}.each do |executable|
      wrappers.install(executable)
    end
  end

  def self.wrappers_path
    GemWrappers::Installer.wrappers_path
  end

  def self.environment_file
    GemWrappers::Environment.file
  end

end