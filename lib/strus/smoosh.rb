require "strus/smoosh/version"

module Strus
  def self.smoosh_the_world
    Object.send(:include, Strus::Smoosh)
  end
  module Smoosh
    def smoosh
      case self
      when String
        # Also matches subclasses of String
        gsub /[[:space:]]+/, ''
      when Array
        # join.smoosh   # doesn't handle hashes
        # map { |item| item.smoosh }.join
        map(&:smoosh).join # equivalent to previous line
      when Hash
        # map { |key, value| key.smoosh + value.smoosh }.smoosh
        to_a.smoosh
      when Symbol, Fixnum
        to_s.smoosh
      else
        raise NotImplementedError
      end
    end
  end
end

# String.include(Strus::Smoosh)


# module CoreExtensions
#   module String
#     def smoosh
#       gsub /[[:space:]]+/, ''
#     end
#   end
#   module Array
#     def smoosh
#       # TODO
#     end
#   end
# end
