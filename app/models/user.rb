class User < ActiveRecord::Base
  before_create :hash_password
  validates :email, presence:true, uniqueness: true
  validates :password, presence:true, length: {minimum: 6}
  validates :name, presence:true
  validates :phone, presence:true, uniqueness: true
  validates :address, presence:true
  has_many :courses, dependent: :delete_all




  def hash_password
    self.password = Digest::MD5::hexdigest(self.password)
  end

  def authenticate(password)
    password_hash = Digest::MD5::hexdigest(password)
    return true if password_hash ==  self.password
    return false
  end

  def is_admin
    return true if self.role == 2
    return false
  end

  def is_teacher
    return true if self.role == 1
    return false
  end

end
