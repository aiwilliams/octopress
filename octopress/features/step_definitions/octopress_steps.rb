Then /a theme-classic project structure should exist/ do

  # Basic project structure
  check_directory_presence(%w(
    _plugins
    _posts
  ), true)

  check_file_presence(%w(
    .rvmrc
    .rbenv-version
    _config.yml
    Gemfile
    _plugins/titlecase.rb
  ), true)

  # Classic theme files
  check_directory_presence(%w(
    _includes
    _layouts
    _sass
    assets
    blog
    images
    javascripts
  ), true)

  check_file_presence(%w(
    blog/archives/index.html
    atom.xml
    favicon.png
    index.html
    _sass/screen.scss
  ), true)

end

Given /^I have a blog$/ do
  create_dir '_posts'
end

Then /^a post with filename "YYYY-MM-DD-(.*)" should exist$/ do |filename|
  check_file_presence([
    "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{filename}"
  ], true)
end

Then /^the post "(.*)" should contain front matter:$/ do |filename, table|
  path = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{filename}"
  table.rows_hash.each do |k,v|
    check_file_content path, /#{k}: #{v}/, true
  end
end
