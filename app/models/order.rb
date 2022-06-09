class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  after_create :confirmation_send
  after_create :confirmation_admin_send

  def confirmation_send
    UserMailer.confirmation_email(self).deliver_now
  end

  def confirmation_admin_send
    UserMailer.confirmation_admin_email(self).deliver_now
  end
end
