class Course < ActiveRecord::Base
  has_many :classrooms, dependent: :delete_all
  belongs_to :user
end
