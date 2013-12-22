require 'test_helper'

class IpValidatorTest < Test::Unit::TestCase
  def test_valid
    valid_ips = %w(
      25.63.41.19
      145.156.19.1
      192.168.0.1
      127.0.0.1
      255.255.255.0
      2607:f0d0:1002:51::4
      2607:f0d0:1002:0051:0000:0000:0000:0004
    )

    Model.reset_callbacks(:validate)
    Model.validates :field, ip: true

    valid_ips.each do |ip|
      model = Model.new
      model.field = ip

      assert model.valid?, "#{ip} valid"
    end
  end

  def test_invalid
    invalid_ips = %w(
      16.16.
      127.0.0.1234
      192.111.109.999
      vjnvj
    )

    Model.validates :field, ip: true

    invalid_ips.each do |ip|
      model = Model.new
      model.field = ip

      refute model.valid?, "#{ip} not valid"
    end
  end
end
