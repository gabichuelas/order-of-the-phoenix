class SearchController < ApplicationController
  def index

    # GIVEN MORE TIME, WOULD REFACTOR THIS INTO SERVICE CLASS
    # AND SEARCH RESULTS FACADE
    
    @house = params[:house]

    conn = Faraday.new("https://www.potterapi.com/v1/") do |req|
      req.params['key'] = ENV['POTTER_API_KEY']
    end

    response = conn.get("characters") do |req|
      req.params['house'] = @house
      req.params['orderOfThePhoenix'] = true
    end

    members_hash = JSON.parse(response.body, symbolize_names: true)

    @members = members_hash.map do |hash|
      Character.new(hash)
    end
  end
end
