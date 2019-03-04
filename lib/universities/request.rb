# frozen_string_literal: true

require 'httparty'

module Universities
  class Request
    include HTTParty
    include UpDupable

    def initialize(country: nil, name: nil)
      @country = country
      @name = name
    end

    def fetch
      response = HTTParty.get(BASE_URL, query: params)
      response.parsed_response.map do |hash|
        Entity.build(hash)
      end
    end

    def country(word)
      dup_and_update(country: word)
    end

    alias_method :by_country, :country

    def name(word)
      dup_and_update(name: word)
    end

    alias_method :by_name, :name

    private

    BASE_URL = 'http://universities.hipolabs.com/search'

    def params
      hash = {}
      hash[:country] = country_params if @country
      hash[:name] = name_params if @name
      hash
    end

    def country_params
      sanitize_string(@country) if @country
    end

    def name_params
      sanitize_string(@name) if @name
    end

    def sanitize_string(string)
      string.gsub(/\s+/, '+')
    end
  end
end
