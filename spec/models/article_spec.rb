require 'rails_helper'
RSpec.describe Article, type: :model do
    let(:article) { create(:article) }
    it "Is valid with valid attributes" do
        expect(article.valid?).to be_truthy
    end
end
