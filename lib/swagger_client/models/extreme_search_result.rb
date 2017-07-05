=begin
#Amadeus Travel Innovation Sandbox

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 1.2

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module SwaggerClient

  class ExtremeSearchResult
    # The <a href=\"https://en.wikipedia.org/wiki/International_Air_Transport_Association_airport_code\">IATA code</a> of the city or airport to which the traveler may go, from the provided origin
    attr_accessor :destination

    # The date departure at the origin, in <a href=\"https://en.wikipedia.org/wiki/ISO_8601\">ISO 8601</a> date format yyyy-MM-dd, to go to the above destination
    attr_accessor :departure_date

    # The date at which the flight from the destination to the origin will depart from the destination. The date is in <a href=\"https://en.wikipedia.org/wiki/ISO_8601\">ISO 8601</a> date format yyyy-MM-dd, in the local date of the origin. This field will not be present in the response if the one-way request parameter is set to true.
    attr_accessor :return_date

    # The minimum total price for one adult passenger for a round trip from the origin to the destination and back. Always a string, formatted correctly for the provided currency
    attr_accessor :price

    # The 2 character alphanumeric <a href=\"https://en.wikipedia.org/wiki/Airline_codes\">IATA airline code</a> of the airline that is responsible for selling the traveler this flight - also known as the Validating Carrier. Airlines are specified using <a href=\"https://en.wikipedia.org/wiki/Airline_codes\"><a href=\"https://en.wikipedia.org/wiki/Airline_codes\">IATA airline code</a>s</a>
    attr_accessor :airline


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'destination' => :'destination',
        :'departure_date' => :'departure_date',
        :'return_date' => :'return_date',
        :'price' => :'price',
        :'airline' => :'airline'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'destination' => :'String',
        :'departure_date' => :'Date',
        :'return_date' => :'Date',
        :'price' => :'String',
        :'airline' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'destination')
        self.destination = attributes[:'destination']
      end

      if attributes.has_key?(:'departure_date')
        self.departure_date = attributes[:'departure_date']
      end

      if attributes.has_key?(:'return_date')
        self.return_date = attributes[:'return_date']
      end

      if attributes.has_key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.has_key?(:'airline')
        self.airline = attributes[:'airline']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @destination.nil?
        invalid_properties.push("invalid value for 'destination', destination cannot be nil.")
      end

      if @price.nil?
        invalid_properties.push("invalid value for 'price', price cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @destination.nil?
      return false if @price.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          destination == o.destination &&
          departure_date == o.departure_date &&
          return_date == o.return_date &&
          price == o.price &&
          airline == o.airline
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [destination, departure_date, return_date, price, airline].hash
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
