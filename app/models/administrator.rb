class Administrator < ApplicationRecord
  authenticates_with_sorcery!

  # Role
  # role_A => なんでもできる
  # role_B => Administratorに対する操作はできない
  # role_C => tennis_gameの閲覧のみ可能
  enum role: { role_A: 0, role_B: 1, role_C: 2 }
  validates :password, confirmation: true
end
