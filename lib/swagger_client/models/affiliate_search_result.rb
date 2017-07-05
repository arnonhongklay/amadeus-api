=begin
#Amadeus Travel Innovation Sandbox

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.2

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module SwaggerClient

  class AffiliateSearchResult
    # The flight from the origin to the destination
    attr_accessor :outbound

    # The return flight from the destination to the origin
    attr_accessor :inbound

    # The price and fare information which applies to all itineraries in this response
    attr_accessor :fare

    # Details of the amount of payout that the affiliate will received per click or if this flight is sold
    attr_accessor :payout

    # The 2 character alphanumeric <a href=\"https://en.wikipedia.org/wiki/Airline_codes\">IATA airline code</a> of the airline that is selling this result
    attr_accessor :airline

    # A link to the page from which this result can be purchased from the affiliate
    attr_accessor :deep_link


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'outbound' => :'outbound',
        :'inbound' => :'inbound',
        :'fare' => :'fare',
        :'payout' => :'payout',
        :'airline' => :'airline',
        :'deep_link' => :'deep_link'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'outbound' => :'FlightSearchBound',
        :'inbound' => :'FlightSearchBound',
        :'fare' => :'AffiliateFlightSearchPrice',
        :'payout' => :'AffiliatePayout',
        :'airline' => :'String',
        :'deep_link' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'outbound')
        self.outbound = attributes[:'outbound']
      end

      if attributes.has_key?(:'inbound')
        self.inbound = attributes[:'inbound']
      end

      if attributes.has_key?(:'fare')
        self.fare = attributes[:'fare']
      end

      if attributes.has_key?(:'payout')
        self.payout = attributes[:'payout']
      end

      if attributes.has_key?(:'airline')
        self.airline = attributes[:'airline']
      end

      if attributes.has_key?(:'deep_link')
        self.deep_link = attributes[:'deep_link']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @outbound.nil?
        invalid_properties.push("invalid value for 'outbound', outbound cannot be nil.")
      end

      if @fare.nil?
        invalid_properties.push("invalid value for 'fare', fare cannot be nil.")
      end

      if @payout.nil?
        invalid_properties.push("invalid value for 'payout', payout cannot be nil.")
      end

      if @airline.nil?
        invalid_properties.push("invalid value for 'airline', airline cannot be nil.")
      end

      if @deep_link.nil?
        invalid_properties.push("invalid value for 'deep_link', deep_link cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @outbound.nil?
      return false if @fare.nil?
      return false if @payout.nil?
      return false if @airline.nil?
      return false if @deep_link.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          outbound == o.outbound &&
          inbound == o.inbound &&
          fare == o.fare &&
          payout == o.payout &&
          airline == o.airline &&
          deep_link == o.deep_link
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [outbound, inbound, fare, payout, airline, deep_link].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
