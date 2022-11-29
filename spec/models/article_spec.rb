require 'rails_helper'

RSpec.describe Article, type: :model do
    it "Testando title" do
        article = FactoryBot.create(:article)
        expect(article.valid?).to be_truthy
    end
    
    
end
