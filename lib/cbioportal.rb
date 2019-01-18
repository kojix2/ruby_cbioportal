require "ostruct"
require "httparty"
require "daru"

require "cbioportal/version"
require "cbioportal/study"
require "cbioportal/cancertype"
require "cbioportal/gene"

# class for cBioPortal
class CBioPortal
  include HTTParty
  base_uri "http://www.cbioportal.org/api"

  def initialize
  end

  # get all studies
  def get_all_studies(studyid = nil)
    url = "/studies"
    response = cget(url)
    # Daru::DataFrame.rows(response.to_a) # not same length error
    daru_vectors = response.to_a.map{|item| Daru::Vector.new(item)}
    # return Daru::DataFrame
    # too many vectors?
    Daru::DataFrame.new(daru_vectors).transpose
  end

  # get study by id
  def get_study(studyid)
    url = "/studies/" + studyid
    response = cget(url)
    # return hash. # should be Daru::Vector? or Construct?
    response.to_h
  end

  private
  def cget(url)
    self.class.get(url)
  end

end
