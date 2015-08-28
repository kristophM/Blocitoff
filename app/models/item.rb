class Item < ActiveRecord::Base
  belongs_to :user

  LIFETIME_IN_DAYS = 7

  def days_left
    LIFETIME_IN_DAYS - (DateTime.now.to_date - created_at.to_date).to_i
  end
end
