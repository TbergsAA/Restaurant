require 'spec_helper'
RSpec.describe Product do
  let(:name) { "Beer" }
  let(:price) { 200 }
  let(:id) { 1 }
  subject(:subject) { described_class.new(name, price, id) }

  describe "category" do
    let(:category) { Category.new("Salads") }

    it 'empty category' do
      expect(subject.category).to be_nil
    end

    it "add category" do
      subject.add_category(category)
      expect(subject.category).to eql(category)
    end
  end
end