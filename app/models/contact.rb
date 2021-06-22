class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :picture
end
