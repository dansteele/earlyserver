require 'factory_girl'
include FactoryGirl::Syntax::Methods
require './spec/factories'

SitesFixture::sites.each do |site|
  Site.first_or_create(site)
end

20.times do
  binding.pry
  create(:user)
end