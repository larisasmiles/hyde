require "minitest/autorun"
require "minitest/pride"
require "./lib/hyde"

class HydeTest < Minitest::Test

  def test_it_exists
    h = Hyde.new

    assert_instance_of Hyde, h 

  end
end
