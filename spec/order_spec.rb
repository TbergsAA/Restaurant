require 'spec_helper'
RSpec.describe Order do
  let(:name) { "Beer" }
  let(:price) { 200 }
  let(:id) { 1 }
  subject(:subject) { described_class.new() }

  describe "add product" do
    let(:product_1) { Product.new("beer", 12, 1) }
    let(:product_2) { Product.new("beer2", 10, 1) }
    let(:product_3) { Product.new("beer3", 12, 1) }
    let(:product_4) { Product.new("beer4", 20, 1) }

    it 'empty products' do
      expect(subject.products).to be_empty
    end

    it "order is open" do
      expect(subject).to be_open
    end

    it "add product" do
      subject.add_product(product_1)
      expect(subject.products).to include(product_1)
    end

    describe "order calculate full price" do
      before do
        subject.add_product(product_1)
        subject.add_product(product_2)
        subject.add_product(product_3)
        subject.add_product(product_4)
        subject.calculate_sum
      end

      it "get full price" do
        expect(subject.total_sum).to eql(54)
      end
    end

    describe "finalize order" do
      before do
        subject.finalize!
      end

      it "order is finalized" do
        expect(subject).to be_finalized
      end

      it "cannot add new product when  order is finalized" do
        expect(subject.add_product(product_3)).to eql("order is finalized")
      end
    end

  end
end