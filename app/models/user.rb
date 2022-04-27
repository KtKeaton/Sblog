require 'digest'

class User < ApplicationRecord
  # attr_accessor :encrypt_password
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true

  before_create :encrypt_password

  has_many :notes

  private
  def encrypt_password
    salted_pw = "eiojre#{self.password}rewropwr"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end

end
