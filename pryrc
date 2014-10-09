# encoding: utf-8

Pry.config.editor = "vim"
Pry.config.color  = true

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

begin
  gem 'awesome_print'
rescue Gem::LoadError
end

Pry.plugins['doc'].activate! if Pry.plugins.keys.include?('doc')

# Launch Pry with access to the entire Rails stack.
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails

  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  end
end

Gem.path.each do |gemset|
  $:.concat(Dir.glob("#{gemset}/gems/pry-*/lib"))
end if defined?(Bundler)
$:.uniq!

AwesomePrint.pry! if defined?(AwesomePrint) && AwesomePrint.respond_to?(:pry!)
