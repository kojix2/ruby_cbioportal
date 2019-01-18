require "cbioportal/version"
require "httparty"
require "daru"

# class for cBioPortal
class CBioPortal
  include HTTParty
  base_uri "http://www.cbioportal.org/api"

  def initialize
  end

  # get all studies
  def studies
    response = self.class.get("/studies")
    # Daru::DataFrame.rows(response.to_a) # not same length error
    daru_vectors = response.to_a.map{|item| Daru::Vector.new(item)}
    Daru::DataFrame.new(daru_vectors).transpose
  end

end
