class MlScoringParamOption < ApplicationRecord
  belongs_to :ml_scoring_param
  validates :value, presence: true
end
