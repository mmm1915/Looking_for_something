class SearchPost < ApplicationRecord
  belongs_to :user

  enum status: { searching: 0, found: 1 }
end
