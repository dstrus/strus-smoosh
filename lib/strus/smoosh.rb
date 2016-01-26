require "strus/smoosh/version"

module Strus
  module Smoosh
    def smoosh
      gsub /[[:space:]]+/, ''
    end
  end
end

# String.include(Strus::Smoosh)
String.send(:include, Strus::Smoosh)
