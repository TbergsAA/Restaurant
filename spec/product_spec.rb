require 'spec_helper'
RSpec.describe Product do
  let(:name) { "Beer" }
  subject(:subject) { described_class.new(name) }

  describe "category" do
    let(:category) { Category.new(name: "Drinks") }

    it 'empty products list' do
      expect(subject.category).to be_nil
    end

    it "add category" do
      expect(subject.add_category(category)).to include(category)
    end
  end
end