class Octopress::Commands::Generate
  attr_reader :options, :project_root

  def initialize(project_path, options={})
    @project_root = File.expand_path project_path
    @options = options
  end

  def jekyll_configuration
    Jekyll.configuration({})
  end

  def execute
    require 'jekyll'
    Jekyll::Site.new(jekyll_configuration).process
  end
end
