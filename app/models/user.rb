class User < ApplicationRecord
            # Include default devise modules.
   
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         enum role: [:user, :admin] # Define roles as enum

  def admin?
    role == 'admin'
  end

  def confirm!
    send_welcome_message(self)
    super
  end

private

  def send_welcome_message(user)
    UserTransactionMailer.welcome_message(user).deliver_now
  end
       
  include DeviseTokenAuth::Concerns::User
end
