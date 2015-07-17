class Card < ActiveRecord::Base
  validates_format_of :number, with: /\A[345]\d{11,15}\Z/
  validates :exp_month, inclusion: {in: (1..12)}
  validates :exp_year, inclusion: {in:(2015..2115)}
  validates :users, presence:true

  before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.exp_year,
                                        self.exp_month,
                                        28)
  end

  scope :expired, lambda { where('expiration_date < ?', Time.now) }

  def set_card_type
    first_num = self.number[0]
    self.card_type = case first_num
    when '3'
      'American Express'
    when '4'
      'Visa'
    when '5'
      'Mastercard'
    end
  end


  has_many :users, through: :user_cards
  has_many :user_cards
end
