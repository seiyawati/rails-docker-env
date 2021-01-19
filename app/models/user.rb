class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                # 大文字小文字を区別しない
                uniqueness: { case_sensitive: false }
    has_secure_password
    # has_secure_passwordのバリデーションは新しくレコードの追加される時のみ適用される
    validates :password, presence: true, length: { minimum: 6 }
end
