require 'erb'
require 'stringex'

class Octopress::Commands::Post
  include Octopress::Util

  attr_reader :options, :project_root, :template_root

  def initialize(project_path, options)
    @post_time = Time.now
    @project_root = File.expand_path project_path
    @template_root = Octopress.template_root
    @options = options
  end

  def filename
    title.to_url
  end

  def title
    options[:title]
  end

  def date
    @post_time.strftime('%Y-%m-%d')
  end

  def time
    @post_time.strftime('%Y-%m-%d %H:%M')
  end

  def execute
    template_path = File.join template_root, 'post.erb'
    template = ERB.new File.read(template_path)
    path = File.join project_root, '_posts', "#{date}-#{filename}.markdown"
    File.open path, 'w' do |f|
      f.write template.result(binding)
    end
  end
end
