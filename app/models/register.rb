class Register < ActiveRecord::Base
  belongs_to :user
  belongs_to :classroom
end
