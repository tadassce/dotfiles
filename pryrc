# encoding: utf-8
# vim: ft=ruby

Pry.config.editor = 'vim'
Pry.config.color  = true

begin
  require 'awesome_print' unless ENV['SKIP_AP']
rescue LoadError
end

Pry.plugins['doc'].activate! if Pry.plugins.keys.include?('doc')

# Launch Pry with access to the entire Rails stack.
rails = File.join Dir.getwd, 'config', 'environment.rb'
require rails if File.exist?(rails) && !ENV['SKIP_RAILS']

Gem.path.each do |gemset|
  $:.concat(Dir.glob("#{gemset}/gems/pry-*/lib"))
end if defined?(Bundler)
$:.uniq!

AwesomePrint.pry! if defined?(AwesomePrint) && AwesomePrint.respond_to?(:pry!)
