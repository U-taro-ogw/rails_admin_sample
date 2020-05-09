class Administrator < ApplicationRecord
  authenticates_with_sorcery!
  has_paper_trail


  # has_many :versions, foreign_key: 'whodunnit', class_name: 'Version', dependent: :restrict_with_error, inverse_of: :email

  # Role
  # role_A => なんでもできる
  # role_B => Administratorに対する操作はできない
  # role_C => tennis_gameの閲覧のみ可能
  enum role: { role_A: 0, role_B: 1, role_C: 2 }
  validates :password, confirmation: true
end
