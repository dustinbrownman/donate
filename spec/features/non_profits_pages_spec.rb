require 'spec_helper'

feature NonProfit do
	feature 'listing' do
		scenario 'with multiple non-profits' do
			non_profit_1 = FactoryGirl.create(:non_profit)
			non_profit_2 = FactoryGirl.create(:non_profit, name: 'PuppyCare')
			non_profit_3 = FactoryGirl.create(:non_profit, name: 'PeopleCare')
			visit non_profits_path
			page.should have_content non_profit_1.name
			page.should have_content non_profit_2.name
			page.should have_content non_profit_3.name
		end
	end

	feature 'creating' do
		scenario 'with valid information' do
			non_profit = FactoryGirl.build(:non_profit)
			visit new_non_profit_path
			fill_in 'Name', with: non_profit.name
			click_on 'Create'
			page.should have_content 'successfully'
		end
	end

	feature 'showing' do
		scenario 'from the index view' do
			non_profit = FactoryGirl.create(:non_profit)
			visit non_profits_path
			click_link non_profit.name
			page.should have_content non_profit.name
		end
	end

	feature 'editing' do
		scenario 'with valid information' do
			non_profit = FactoryGirl.create(:non_profit)
			visit edit_non_profit_path(non_profit)
			fill_in 'Name', with: "new name"
			click_on 'Update'
			page.should have_content 'successfully'
		end
	end
end