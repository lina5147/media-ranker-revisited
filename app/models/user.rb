class User < ApplicationRecord
  has_many :votes
  has_many :ranked_works, through: :votes, source: :work

  validates :uid, uniqueness: { scope: :provider}
  validates :username, uniqueness: true, presence: true
end
