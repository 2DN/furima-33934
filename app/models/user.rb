class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_EMAIL_REGEX = /@.+/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶ]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name_kanji
    validates :first_name_kanji
    validates :last_name_kana
    validates :first_name_kana
    validates :date_of_birth
  end

  validates_format_of :email, with: VALID_EMAIL_REGEX, message: 'には「@」を含めてください'
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください!'
  validates_format_of :last_name_kanji, with: VALID_KANJI_REGEX, message: 'には全角文字を使用してください'
  validates_format_of :first_name_kanji, with: VALID_KANJI_REGEX, message: 'には全角文字を使用してください'
  validates_format_of :last_name_kana, with: VALID_KATAKANA_REGEX, message: 'には全角カタカナを使用してください'
  validates_format_of :first_name_kana, with: VALID_KATAKANA_REGEX, message: 'には全角カタカナを使用してください'
end
