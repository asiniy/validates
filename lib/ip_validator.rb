require 'ipaddr' # ruby core library

class IpValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message]) if (IPAddr.new(value) rescue nil).nil?
  end
end
