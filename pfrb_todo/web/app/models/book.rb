class Book < ApplicationRecord
  # ----------------------------------------------------------------------------
  # Call Back
  # ----------------------------------------------------------------------------
  enum sales_status: {
    reservation:  0,
    now_on_sale:  1,
    end_of_print: 2,
  }

  # ----------------------------------------------------------------------------
  # Scope
  # ----------------------------------------------------------------------------
  scope :costly,        ->         { where("price > ?", 3000) }
  scope :written_about, -> (theme) { where("name like ?", "%#{theme}%") }
  scope :find_price,    -> (price) { find_by(price:price) }

  # ----------------------------------------------------------------------------
  # Relation
  # ----------------------------------------------------------------------------
  belongs_to :publisher
  has_many   :book_authors
  has_many   :authors, through: :book_authors

  # ----------------------------------------------------------------------------
  # Validate
  # ----------------------------------------------------------------------------
  validates :name,  presence: true
  validates :name,  length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0}

  # Custome Validate
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end

  # ----------------------------------------------------------------------------
  # Call Back
  # ----------------------------------------------------------------------------
  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  before_validation :add_lonely_to_planet
  def add_lonely_to_planet
    self.name = self.name.gsub(/Planet/) do |matched|
      "lonely #{matched}"
    end
  end

  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
    Rails.logger.warn price
  end

  after_destroy :if => :high_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check!!"
  end
  def high_price?
    price >= 5000
  end

end
