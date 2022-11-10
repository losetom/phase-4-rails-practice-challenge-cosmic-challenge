class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, presence: true
  # restricts scientist from joining same mission twice
  validates :scientist, uniqueness: {scope: :name}
end
