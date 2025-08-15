class SearchPost < ApplicationRecord
  belongs_to :user

  enum :status, { searching: 0, found: 1 }

  validates :item_name, presence: true
  validate :found_place_presence_if_found

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at found_place item_name search_place status user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end

  def found_place_presence_if_found
    if status == "found" && found_place.blank?
      errors.add(:found_place, "を入力してください")
    end
  end
end
