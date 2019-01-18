require "ostruct"
require "httparty"
require "daru"

require "cbioportal/version"
require "cbioportal/study"
require "cbioportal/cancer_type"
require "cbioportal/gene"

# ToDo & Memo
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
  base_uri "http://www.cbioportal.org/api"

  def initialize
  end

  # get all studies
  def get_all_studies(studyid = nil)
    url = "/studies"
    create_data_frame(url)
  end

  # get study by id
  def get_study(studyid)
    url = "/studies/" + studyid
    response = cget(url)
    # return hash. # should be Daru::Vector? or Construct?
    response.to_h
  end

  # get all gene panels
  def get_all_gene_panels
    url = "/gene-panels"
    create_data_frame(url)
  end

  # get all genes
  def get_all_genes
    url = "/genes"
    create_data_frame(url)
  end

  # get all molecular profiles
  def get_all_molecular_profiles
    url = "/molecular-profiles"
    create_data_frame(url)
  end

  # get all cancer types
  def get_all_cancer_types
    url = "/cancer-types"
    create_data_frame(url)
  end

  # get all clinical atributes
  def get_all_clinical_attributes
    url = "/clinical-attributes"
    create_data_frame(url)
  end

  # get all sample lists
  def get_all_sample_lists
    url = "/sample-lists"
    create_data_frame(url)
  end
  

  private
  def cget(url)
    self.class.get(url)
  end

  def create_data_frame(url)
    response = cget(url)
    hash_in_array_to_dataframe(response.to_a)
  end

  def hash_in_array_to_dataframe(array)
    # Daru::DataFrame.rows(hash_array) # not same length error
    daru_vectors = array.map{|item| Daru::Vector.new(item)}
    Daru::DataFrame.new(daru_vectors).transpose
  end

end

# for debug
C = CBioPortal.new
