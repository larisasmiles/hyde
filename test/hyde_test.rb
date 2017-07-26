require_relative 'test_helper'
require "./lib/hyde"

class HydeTest < Minitest::Test

  def test_if_error_if_no_argv_1
    h = Hyde.new(["new", ""])
    retVal = h.evaluate()
    assert_equal retVal, false
  end

  def test_it_creates_directory_tree


end
