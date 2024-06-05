class TrainingList < ApplicationRecord
    has_many_attached :images
    has_many :training1s, dependent: :destroy
    has_many :training2s, dependent: :destroy
    has_many :training3s, dependent: :destroy
    has_many :training4s, dependent: :destroy
end
