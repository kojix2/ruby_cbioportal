require 'httparty'
require 'daru'

require 'cbioportal/version'

# TODO: & Memo
# 1. return Daru::DataFrame
# 2. return Hash
# 3. redturn Struct class
# 4. rename methods
#
# 1. Get 2.Post
#
# TopLevel
#  Study
#  Cancer-types
#  Gene
#  Crinical-attributes
#  Molecular-profiles
#  Gene-panels
#  Sample-list

# class for cBioPortal
class CBioPortal
  include HTTParty
  base_uri 'http://www.cbioportal.org/api'

  def initialize; end

  def get(*url)
    create_data_frame(*url)
  end

  def cget(*url)
    self.class.get(*url)
  end

  private
  def create_data_frame(*url)
    response = cget(*url)
    # p response
    hash_in_array_to_dataframe(response.to_a)
  end

  def hash_in_array_to_dataframe(array)
    # Daru::DataFrame.rows(hash_array) # not same length error
    daru_vectors = array.map { |item| Daru::Vector.new(item) }
    Daru::DataFrame.new(daru_vectors).transpose
  end
end

C = CBioPortal.new
