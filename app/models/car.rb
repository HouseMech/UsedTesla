class Car < ApplicationRecord
  has_many :model_s_data
  has_many :model_three_data
  has_many :model_x_data
end
