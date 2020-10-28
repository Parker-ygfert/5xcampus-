class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true

  # before_create :encrypt_password

  #* keyword argument
  # def self.login(account:, password:)
  # def login(options)
  #   if options[:account] and options[:password]  
  #     User.find_by(account: options[:account],
  #             password: bigbang(options[:password]))
  #             # password: Digest::SHA1.hexdigest("x#{options[:password]}y"))
  #   end
  # end
  
  # private
  # def encrypt_password
  #   # self.password = bigbang(self.password)
  #   #* 右方的 password 方法可拿掉 self
  #   self.password = bigbang(password)
  # end

  # def bigbang(string)
  #   string = "x#{string}y"
  #   Digest::SHA1.hexdigest(string)
  # end
  
end
