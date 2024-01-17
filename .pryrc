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
  Detaso::Database.first.connect!
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
