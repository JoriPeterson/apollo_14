class Astronaut < ApplicationRecord
  attr_reader :average_age

  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  # def average_age
  #   Astronaut.average(:age)
  # end
end
