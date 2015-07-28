require 'spec_helper'
require 'database_cleaner'

describe "it should handle basic API requests" do
  DatabaseCleaner.strategy = :truncation

  include Rack::Test::Methods

  def app
    App
  end

  before do
    SitesFixture::sites.each do |site|
      Site.create(site)
    end
  end

  it "gets a list of sites" do
    get "/techlog/site"
    expect(last_response.ok?).to be true
    expect(last_response.body).to eq Site.all.to_json
  end

  after do
    DatabaseCleaner.clean
  end
end