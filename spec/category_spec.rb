require 'spec_helper'
RSpec.describe Category do
  let(:name) { "drink" }
  subject(:subject) { described_class.new(name) }
  describe "add name" do
    it 'with method' do
      expect(subject.name).to eql(name)
    end
  end

  describe "products" do
    let(:product) { Product.new("Beer", 200, 1 ) }

    it 'empty products list' do
      expect(subject.products).to be_empty
    end

    it "add product" do
      expect(subject.add_product(product)).to include(product)
    end
  end
end