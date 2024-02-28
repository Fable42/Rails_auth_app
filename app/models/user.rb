class User < ApplicationRecord
  has_secure_password

  before_validation :titleize

  validates :email, 
    presence: true, #поле не пусто
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i } #символы, @, символы, . , символы 

  validates :tag,
    presence: true,
    uniqueness: true,
    length: { in: 3..20 },
    format: { without: /\s/ } #нельзя использовать пробел

  validates :name,
    presence: true,
    uniqueness: true,
    format: { with: /\A[A-Z][a-z]*( [A-Z][a-z]*)?\z/ }, #первая буква всегда заглавная а остальные строчные, и допускается исп двух слов
    length: { in: 3..16 }

  validates :password,
    format: { with: /\A(?=.*[A-Z])(?=.*\d)[^ ]+\z/ } #хотя бы одна заглавная и хотя бы одна цифра и нет пробелов

  def titleize
    self.name = name.to_s.split.map(&:capitalize).join(' ')
    self.tag = tag.to_s.split.map(&:capitalize).join(' ')
  end

end
