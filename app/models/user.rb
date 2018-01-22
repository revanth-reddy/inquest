class User < ActiveRecord::Base

	before_save { self.email = email.downcase }
  before_create :allot_score
	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :college,  presence: true, length: { maximum: 50 }
  validates :Contact_number,  presence: true, length: { maximum: 10 }      
  has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }  
  has_many :attempts

  private

    def allot_score
      self.score = 1
    end        
end
