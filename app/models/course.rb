class Course < ActiveRecord::Base
  has_many :classrooms, dependent: :delete_all
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
end
