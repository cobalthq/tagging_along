require "tagging_along/version"
require "tagging_along/array"

module TaggingAlong
  module ClassMethods
    def is_taggable_on(*attributes)
      options = attributes.extract_options!
      separator = options[:separator] || ','

      attributes.each do |attribute|
        # Define method that turns the attribute into an array of its comma-
        # separated values
        define_method :"#{attribute}_tags" do
          send(attribute).nil? ? [] : send(attribute).split(separator)
        end

        # Define method that turns the attribute into a human readable comma-
        # space-separated list in one string
        define_method :"#{attribute}_list" do
          send(attribute).nil? ? '' : send(attribute).split(separator).join("#{separator} ")
        end
      end
    end

    def taggable_on?(attribute)
      begin
        new.send(:"#{attribute}_tags")
        new.send(:"#{attribute}_list")
        true
      rescue Exception => e
        false
      end
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end
end
