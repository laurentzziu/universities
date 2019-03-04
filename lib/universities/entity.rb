# frozen_string_literal: true
require 'active_support/core_ext/hash'

module Universities
  class Entity
    ATTRIBUTES_MAPPING = {
      web_pages: 'web_pages',
      alpha_two_code: 'alpha_two_code',
      state_province: 'state-province',
      country: 'country',
      domains: 'domains',
      name: 'name'
    }

    def initialize(web_pages: nil, alpha_two_code: nil, state_province: nil, country: nil, domains: nil, name: nil)
      local_variables.each do |key|
        self.class.class_eval do
          attr_reader key
        end
        value = eval(key.to_s)
        instance_variable_set("@#{key}", value)
      end
    end

    def self.build(hash)
      new(**parse_attributes(hash))
    end

    def self.parse_attributes(hash)
      hash = hash.with_indifferent_access
      ATTRIBUTES_MAPPING.map do |attribute, hash_key|
        [attribute, hash.dig(hash_key)]
      end.to_h
    end
  end
end