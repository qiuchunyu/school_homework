require 'pry'
require 'minitest/autorun'
require 'rest_client'
require 'json'

Given /^I send a request to CHS API with (.*)$/ do |params|
  base_url = 'https://cphs-api.schoolzilla.com'
  school_search = '/schools?school=Aspire'
  cdscode_search = '/school/01612590120188'

  if params == 'school name'
    url = "#{base_url}" + "#{school_search}"
  elsif params == 'CDSCode'
    url = "#{base_url}" + "#{cdscode_search}"
  else
    puts 'Unknown api request param'
  end
  response = RestClient.get("#{url}")

  if response.code == 200
    @data = JSON.parse response.body
  else
    puts 'Unexpected response code: ' + response.code
  end
end

Then /^I should receive schools that match the name$/ do
  @data['data'].each do |school|
    if school['School'].include?('Aspire')
      puts 'School Name: ' + school['School']
      puts 'School Type: ' + school['EILName']
      puts 'Website: '     + school['Website']
      address = ''
      address += "#{school['School']} \n\t\t#{school['City']}, #{school['State']} #{school['Zip']}"
      puts 'Address: '    + address
      puts '======================================================'
    end
  end
end

Then /^I should receive a school that match the code$/ do
  if @data['CDSCode']== '01612590120188'
    puts 'School Name: ' + @data['School']
    puts 'School Type: ' + @data['EILName']
    puts 'Website: '     + @data['Website']
    address = ''
    address += "#{@data['School']} \n\t\t#{@data['City']}, #{@data['State']} #{@data['Zip']}"
    puts 'Address: '    + address
    puts '======================================================'
  end
end