class Article < ApplicationRecord
    paginates_per 5

    include Visible
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one_attached :file

    accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :status, presence: true
    
  end
  