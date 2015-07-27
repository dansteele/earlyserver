require 'spec_helper'

describe "it should handle basic API requests" do

  before do
    SitesFixture::sites.each do |site|
      Site.create(site)
    end
  end

  it "gets a list of sites" do
    get "/techlog/sites"
    expect(last_response.ok?).to be true
    expect(last_response.body).to be SitesFixture::sites
  end
end