RSpec.describe CBioPortal do
  it "has a version number" do
    expect(CBioPortal::VERSION).not_to be nil
  end

  describe "studies" do
    it "#get_all_studies" do
      cbp = CBioPortal.new
      expect(cbp.get_all_studies.class).to be Daru::DataFrame
    end

    it "#get_study(studyid)" do
      cbp = CBioPortal.new
      expect(cbp.get_study("acc_tcga").class).to be Hash
    end
  end

  describe "genes" do
    it "#get_all_genes" do
      cbp = CBioPortal.new
      expect(cbp.get_all_genes.class).to be Daru::DataFrame
    end
  end

  describe "molecular-profiles" do
    it "#get_all_molecular_profiles" do
      cbp = CBioPortal.new
      expect(cbp.get_all_molecular_profiles.class).to be Daru::DataFrame
    end
  end

  describe "gene-panels" do
    it "#get_all_gene_panels" do
      cbp = CBioPortal.new
      expect(cbp.get_all_genes.class).to be Daru::DataFrame
    end
  end

  describe "cancer-types" do
    it "#get_all_cancer_types" do
      cbp = CBioPortal.new
      expect(cbp.get_all_cancer_types.class).to be Daru::DataFrame
      end
  end

  describe "clinical-attributes" do
    it "#get_all_clinical_attributes" do
      cbp = CBioPortal.new
      expect(cbp.get_all_clinical_attributes.class).to be Daru::DataFrame
    end
  end
end
