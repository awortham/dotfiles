Pry.config.editor = "nvim"
Pry.config.skip_cruby_source = true

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, "repeat last command") do
  pry_instance.run_command Pry.history.to_a.last
end

if defined?(PryByebug)
  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
  Pry.commands.alias_command "f", "finish"
end

def dfc
  if defined?(Detaso)
    Detaso::Database.first.connect!
  end
end

if defined?(Detaso)
  if Rails.env.development?
    Current.client = Client.first
    dfc
  end
end

def org!(organization)
  Current.organization = organization
end

if defined?(Kairos)
  if Rails.env.development?
    org! Organization.first
  end
end

if defined?(Pry)
  begin
    require "rb-readline"
    require "readline"
  rescue LoadError
  end

  if defined?(RbReadline)
    def RbReadline.rl_reverse_search_history(sign, key)
      rl_insert_text `cat ~/.local/share/pry/pry_history | awk '!seen[$0]++' | fzf --tac | tr '\n' ' '`
    end
  end
end
