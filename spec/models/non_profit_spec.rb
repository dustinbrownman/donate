require 'spec_helper'

describe NonProfit do
	it { should validate_presence_of :name }
end