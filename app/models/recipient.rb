class Recipient < ApplicationRecord
  STATUSES = %w|queued sent failed|

  belongs_to :campaign

  validates :name, presence: true
  validates :status, inclusion: {in: STATUSES, allow_nil: true}

  validate :email_and_phone_cannot_be_blank

  private

  def email_and_phone_cannot_be_blank
    if email.blank? && phone.blank?
      errors.add(:email, 'and phone cannot both be blank')
    end
  end
end
