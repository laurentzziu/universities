# frozen_string_literal: true

# From https://gist.github.com/eliav-lavi/1b739bc57719bd9755f2dee3f5a02cef#file-up_dupable-rb
# by Eliav Lavi (https://github.com/eliav-lavi)
module UpDupable
  def dup_and_update(**args)
    self.class.new(clean_ivars.merge(args))
  end

  private

  def clean_ivars
    instance_variables_get.each_with_object({}) { |(k, v), hash| hash[k.to_s.delete('@').to_sym] = v }
  end

  def instance_variables_get
    instance_variables.each_with_object({}) { |ivar, hash| hash[ivar] = instance_variable_get(ivar) }
  end
end
