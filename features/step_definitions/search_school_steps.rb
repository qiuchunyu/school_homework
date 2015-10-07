require 'pry'
require 'minitest/autorun'
require 'rest_client'
require 'json'

Given /^I send a request to CHS API with (.*)$/ do |params|
  if params == 'school name'
    url = $NAME_URL
  elsif params == 'CDSCode'
    url = $CDSCODE_URL
  else
    puts 'Unknown api request param'
  end

  response = RestClient.get("#{url}")

  if response.code == 200
    @data = JSON.parse response.body
  else
    puts 'Unexpected HTTP response: ' + response.code
  end
end

Then /^I should receive schools that match the name$/ do
  @data['data'].each do |school|
    if school['School'].include?('Aspire')
      address = "#{school['Street']} \n\t\t#{school['City']}, #{school['State']} #{school['Zip']}"
      print_school_information(school['School'], school['EILName'], school['Website'], address)
    else
      puts 'No school match the name: Aspire'
    end
  end
end

Then /^I should receive a school that match the code$/ do
  if @data['CDSCode']== '01612590120188'
    address = "#{@data['Street']} \n\t\t#{@data['City']}, #{@data['State']} #{@data['Zip']}"
    print_school_information(@data['School'], @data['EILName'], @data['Website'], address)
    puts '======================================================'
  else
    puts 'Unable to find the school with the CDSCode'
  end
end

private

def print_school_information(name, type, website, address)
  # address = ''
  puts 'School Name: ' + name
  puts 'School Type: ' + type
  puts 'Website: '     + website
  puts 'Address: '     + address
  puts '======================================================'
end