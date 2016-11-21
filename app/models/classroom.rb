class Classroom < ActiveRecord::Base
  has_many :registers,  dependent: :delete_all

end
