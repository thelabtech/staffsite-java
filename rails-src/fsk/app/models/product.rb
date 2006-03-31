class Product < ActiveRecord::Base
  set_table_name	"fsk_Products"

  has_many :line_items
  belongs_to :kit_category

  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :price
  
  validates_format_of :image_filename,
    :with => %r{.+\.(gif|jpg)$}i,
    :message => "must be a gif or jpeg file"
  
  protected
  def validate
    if price && price < 0.01
      errors.add(:price, "should be positive") 
    end
  end
  
end
