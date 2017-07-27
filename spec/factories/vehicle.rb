require "faker"
FactoryGirl.define do
	factory :vehicle do
		plate "#{['ABC','DFG'].sample}#{Random.rand(0..9)}#{Random.rand(0..9)}#{Random.rand(0..9)}"
		color Faker::Color.color_name
		year [*1970..DateTime.now.year].sample
	end
end