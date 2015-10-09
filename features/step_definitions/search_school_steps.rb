require 'pry'
require 'rest_client'
require 'rspec'
require 'json'

Given /^I send a request to CHS API with (.*)$/ do |params|
  if params == 'school name'
    url = $NAME_URL
  elsif params == 'CDSCode'
    url = $CDSCODE_URL
  else
    puts 'Unexpected api request param'
  end

  response = RestClient.get("#{url}")

  if response.code == 200
    @data = JSON.parse response.body
  else
    puts 'Unexpected HTTP response: ' + response.code
  end
end

Then /^I should receive (schools|a school) that match the (.*)$/ do |list, search_param|
  school_list = Array.new() {Hash.new}

  if search_param == 'code' && @data['data'] == nil
    school_list.push(@data)
    school_list.size.should == 1
  elsif search_param == 'name'
    school_list = @data['data']
  end

  school_list.each do |school|
    if list == 'schools'
     school['School'].should include('Aspire')
    else
     school['CDSCode'].should eql('01612590120188')
    end
    address = "#{school['Street']} \n\t\t#{school['City']}, #{school['State']} #{school['Zip']}"
    print_school_information(school['School'], school['EILName'], school['Website'], address)
  end
end

private

def print_school_information(name, type, website, address)
  puts 'School Name: ' + name
  puts 'School Type: ' + type
  puts 'Website: '     + website
  puts 'Address: '     + address
  puts '======================================================'
end