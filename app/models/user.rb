class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /@.+/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_KANJI_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶ]+\z/

  validates :nickname, presence: true
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください!'
  validates_format_of :last_name_kanji, presence: true, with: VALID_KANJI_REGEX, message: 'には全角文字を使用してください'
  validates_format_of :first_name_kanji, presence: true, with: VALID_KANJI_REGEX, message: 'には全角文字を使用してください'
  validates_format_of :last_name_kana, presence: true, with: VALID_KATAKANA_REGEX, message: 'には全角カタカナを使用してください'
  validates_format_of :first_name_kana, presence: true, with: VALID_KATAKANA_REGEX, message: 'には全角カタカナを使用してください'
  validates :date_of_birth, presence: true
end
