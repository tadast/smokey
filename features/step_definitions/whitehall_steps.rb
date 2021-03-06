Then /^I should see the departments and policies section on the homepage$/ do
  html = get_request "#{@host}/", cache_bust: @bypass_varnish
  doc = Nokogiri::HTML(html)
  assert doc.css('#departments-and-policy')
end

Then /^I should be able to view policies$/ do
  follow_link_to_first_policy_on_policies_page
end

Then /^I should be able to view publications$/ do
  follow_link_to_first_publication_on_publications_page
end

Then /^I should be able to view announcements$/ do
  follow_link_to_first_announcement_on_announcements_page
end

Then /^I should be able to view government search results for "([^"]*)"$/ do |term|
  html = get_request "#{@host}/government/search?q=#{term}", cache_bust: @bypass_varnish
  doc = Nokogiri::HTML(html)
  assert doc.css('.search_results li').count > 0, "No search results returned from /government/search for '#{term}'"
end

Then /^I should be able to view specialist search results for "([^"]*)"$/ do |term|
  html = get_request "#{@host}/specialist/search?q=#{term}", cache_bust: @bypass_varnish
  doc = Nokogiri::HTML(html)
  assert doc.css('.search-results li').count > 0, "No search results returned from /specialist/search for '#{term}'"
end

When /^I do a whitehall search for consultations from DECC on energy after april 2011$/ do
  url = "#{@host}/government/publications?keywords=&publication_filter_option=consultations&topics%5B%5D=energy&departments%5B%5D=department-of-energy-climate-change&direction=after&date=2011-04-01"
  @response = get_request(url, cache_bust: @bypass_varnish )
end

When /^I do a whitehall search for "([^"]*)"$/ do |term|
  url = "#{@host}/government/publications?keywords=#{uri_escape(term)}"
  @response = get_request(url, cache_bust: @bypass_varnish)
end

def follow_link_to_first_policy_on_policies_page
  html = get_request("#{@host}/government/policies", cache_bust: @bypass_varnish)
  doc = Nokogiri::HTML(html)
  link_to_policy = doc.at('.document-row a')
  assert ! link_to_policy.nil?, "No policy links found"
  href = link_to_policy.attributes['href'].value
  get_request("#{@host}#{href}", cache_bust: @bypass_varnish)
end

def follow_link_to_first_announcement_on_announcements_page
  html = get_request("#{@host}/government/announcements", cache_bust: @bypass_varnish)
  doc = Nokogiri::HTML(html)
  link_to_announcement = doc.at('.document-row a')
  assert ! link_to_announcement.nil?, "No announcement links found"
  href = link_to_announcement.attributes['href'].value
  get_request("#{@host}#{href}", cache_bust: @bypass_varnish)
end

def follow_link_to_first_publication_on_publications_page
  html = get_request("#{@host}/government/publications", cache_bust: @bypass_varnish)
  doc = Nokogiri::HTML(html)
  link_to_publication = doc.at('.document-row a')
  assert ! link_to_publication.nil?, "No publication links found"
  href = link_to_publication.attributes['href'].value
  get_request("#{@host}#{href}", cache_bust: @bypass_varnish)
end
