class Task < ApplicationRecord

  
  validates :name, presence: true
  validates :date, presence: true 
  validates :time, presence: true
  validate :valid_date?
  belongs_to :user


  def valid_date?
    if date.present? && date < Date.today
      errors.add(:date, "is not valid")
    end
  end

end
