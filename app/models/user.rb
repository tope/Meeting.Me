class User < ActiveRecord::Base

  attr_accessor 	:password
  
  has_many			:presentations
  
  #protect method from mass-update
  attr_protected	:admin
  
  # validation
  
  validates_length_of		:email, :within	=>	3..100
  validates_uniqueness_of	:email,	:case_sensitive => false
  validates_presence_of		:name
  validates_length_of		:password, :within => 4..40, :if => :password_required?
  validates_confirmation_of	:password, :if	=> 	:password_required?
  
  # callback
  before_save	:encrypt_password
  
  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{pass}--")
  end
  
  def self.authenticate(email, pass)
    user = find_by_email(email)
    #user && user.authenticated?(pass) ? user : nil
  end
  
  def authenticated?(pass) 
    encrypted_password == User.encrypt(pass, salt)
  end
  
  protected
  
  def encrypt_password
    #return if password.blank 
    if new_record?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now}--#{email}--")
    end
    self.encrypted_password = User.encrypt(password, salt)
  end
  
  def password_required?
    encrypted_password.blank? || !password.blank?
  end
  

end
