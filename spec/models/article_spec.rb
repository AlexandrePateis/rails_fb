require 'rails_helper'
RSpec.describe Article, type: :model do
    let(:article) { create(:article) }

    it "Is valid with valid attributes" do
        expect(article.valid?).to be_truthy
    end

    describe "validations" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:body) }
        it { should validate_presence_of(:status) }
    end
    

end
