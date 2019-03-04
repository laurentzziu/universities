# frozen_string_literal: true

require 'universities/version'

require 'universities/up_dupable'
require 'universities/request'
require 'universities/entity'

module Universities
  def self.get
    Request.new
  end

  def self.get_all
    Request.new.fetch
  end
end
