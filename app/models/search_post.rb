class SearchPost < ApplicationRecord
  belongs_to :user

  enum status: { searching: 0, found: 1 }

  validates :item_name, presence: true
  validates :found_place, presence: true, if: :found?

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at found_place item_name search_place status user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
