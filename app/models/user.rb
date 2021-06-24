class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :books
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :books, through: :likes

  validates :nickname, presence: true, uniqueness: true
  validates :email, uniqueness: true

  PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字か数字のみ使用できます'

#----------------- ユーザーアカウント論理削除機能の実装 --------------------#
  
  # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
end
