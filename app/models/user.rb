class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # before_action :set_current_user, except: [:show]

  has_many :articles, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
