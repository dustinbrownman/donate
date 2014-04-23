class NonProfit < ActiveRecord::Base
	validates :name, presence: true
end
