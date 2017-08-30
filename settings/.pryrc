Pry.config.color = true
Pry.config.prompt = [
  proc { |target_self, nest_level, pry|
        "[#{pry.input_array.size}]\001\e[0;32m\002#{Pry.config.prompt_name}\001\e[0m\002(\001\e[0;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}> "
       },
  proc { |target_self, nest_level, pry|
        "[#{pry.input_array.size}]\001\e[0;32m\002#{Pry.config.prompt_name}\001\e[0m\002(\001\e[1;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}* "
       }
]

# === PRY HISTORY ===
Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

# === AWESOME PRINT ===
begin
  require 'awesome_print'
  AwesomePrint.defaults = {
    indent:        2,      # Number of spaces for indenting.
    index:         false,   # Display array indices.
    html:          false,  # Use ANSI color codes rather than HTML.
    multiline:     true,   # Display in multiple lines.
    plain:         false,  # Use colors.
    raw:           false,  # Do not recursively format instance variables.
    sort_keys:     false,  # Do not sort hash keys.
    sort_vars:     true,   # Sort instance variables.
    limit:         false,  # Limit arrays & hashes. Accepts bool or int.
    ruby19_syntax: false,  # Use Ruby 1.9 hash syntax in output.
    color: {
      args:       :pale,
      array:      :white,
      bigdecimal: :blue,
      class:      :yellow,
      date:       :greenish,
      falseclass: :red,
      integer:    :blue,
      float:      :blue,
      hash:       :pale,
      keyword:    :cyan,
      method:     :purpleish,
      nilclass:   :red,
      rational:   :blue,
      string:     :yellowish,
      struct:     :pale,
      symbol:     :cyanish,
      time:       :greenish,
      trueclass:  :green,
      variable:   :cyanish
    }
  }
  # AwesomePrint.pry!
  Pry.config.print = proc do |output, value|
    arrow = [String, Integer, Float, TrueClass, FalseClass, NilClass].any? { |c| value.is_a?(c) } ? "=> " : ""
    output.puts "#{arrow}#{value.ai}\n\n"
  end
rescue LoadError => err
  puts "no awesome_print :("
end

# === RAILS ===
if defined?(Rails)
  Rails.application.eager_load!
end

# === PRY BYEBUG ===
if defined?(PryByebug)
   def pry_debug
     Pry.commands.alias_command 't', 'show-stack'
     Pry.commands.alias_command 's', 'step'
     Pry.commands.alias_command 'n', 'next'
     Pry.commands.alias_command 'c', 'continue'
     Pry.commands.alias_command 'f', 'finish'
     Pry.commands.alias_command 'u', 'up'
     Pry.commands.alias_command 'd', 'down'
     Pry.commands.alias_command 'b', 'break'
     Pry.commands.alias_command 'w', 'whereami'

     puts "Debugging Shortcuts"
     puts 'w  :  whereami'
     puts 's  :  step'
     puts 'n  :  next'
     puts 'c  :  continue'
     puts 'f  :  finish'
     puts 'Stack movement'
     puts 't  :  show-stack'
     puts 'ff :  frame'
     puts 'u  :  up'
     puts 'd  :  down'
     puts 'b  :  break'
     ""
   end

   # Longer shortcuts
   Pry.commands.alias_command 'ff', 'frame'

   Pry.commands.alias_command 'sss', 'show-stack'
   Pry.commands.alias_command 'ss', 'step'
   Pry.commands.alias_command 'nn', 'next'
   Pry.commands.alias_command 'cc', 'continue'
   Pry.commands.alias_command 'fin', 'finish'
   Pry.commands.alias_command 'uu', 'up'
   Pry.commands.alias_command 'dd', 'down'
   Pry.commands.alias_command 'bb', 'break'
   Pry.commands.alias_command 'ww', 'whereami'
end

# === CONVENIENCE METHODS ===
# Stolen from https://gist.github.com/807492
# Use Array.toy or Hash.toy to get an array or hash to play with
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end
