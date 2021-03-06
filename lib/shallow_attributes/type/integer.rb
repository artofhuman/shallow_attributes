module ShallowAttributes
  module Type
    # This class cange object to Integer.
    #
    # @abstract
    #
    # @since 0.1.0
    class Integer
      # Convert value to Integer type
      #
      # @private
      #
      # @param [Object] value
      # @param [Hash] option
      # @option options [boolean] :allow_nil cast `nil` to integer or float
      #
      # @example Convert sting to integer value
      #   ShallowAttributes::Type::Integer.new.coerce('2001')
      #     # => 2001
      #
      # @raise [InvalidValueError] if values is invalid
      #
      # @return [Integer]
      #
      # @since 0.1.0
      def coerce(value, options = {})
        case value
        when nil then options[:allow_nil] ? 0 : nil
        when ::TrueClass then 1
        when ::FalseClass then 0
        else
          value.respond_to?(:to_i) ? value.to_i
            : raise(ShallowAttributes::Type::InvalidValueError, %(Invalid value "#{value}" for type "Integer"))
        end
      end
    end
  end
end
