class Octopress::Commands::Post
  include Octopress::Util

  attr_reader :options, :project_root

  def initialize(project_path, options)
    @project_root = File.expand_path project_path
    @template_root = Octopress.template_root
    @options = options
  end

  def post_name
    options[:name]
  end

  def execute
    path = File.join project_root, '_posts', "#{Time.now.strftime('%Y-%m-%d')}-#{post_name}.markdown"
    File.open path, 'w' do |f|
      f.puts 'You did it'
    end
  end
end
