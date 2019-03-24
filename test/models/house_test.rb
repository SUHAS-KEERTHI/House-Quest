require "test_helper"

describe House do
  let(:house) { House.new }

  it "must be valid" do
    value(house).must_be :valid?
  end
end
