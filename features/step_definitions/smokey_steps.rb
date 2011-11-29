require 'plek'
require 'rest_client'

Given /^I am testing "(.*)"$/ do |service|
  p = Plek.new ENV['TARGET_PLATFORM'] || "preview"
  @host = p.find(service)
  puts @host
end

When /^I visit "(.*)"$/ do |path|
  visit "#{@host}#{path}"
end

When /^I visit "(.*)" twice$/ do |path|
  RestClient::Request.new(:url => @host + path, :method => 'get', :user => ENV['USERNAME'], :password => ENV['PASSWORD']).execute
  @response = RestClient::Request.new(:url => @host + path, :method => 'get', :user => 'betademo', :password => 'nottobesharedout').execute
end

Then /^I should be able to visit:$/ do |table|
  table.hashes.each do |row|
    visit "#{@host}#{row['Path']}"
    webrat_session.response_code.should == 200
  end
end

Then /^I should see "(.*)"$/ do |text|
  response_body.should contain text
end

Then /^I should get a (\d+) status code$/ do |status|
  webrat_session.response_code.should == status.to_i
end

Then /^I should get content from the cache$/ do
  @response.headers[:x_cache].should == "HIT"
end