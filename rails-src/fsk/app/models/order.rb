class Order < ActiveRecord::Base
	set_table_name	"fsk_Orders"
	
	belongs_to :user, :foreign_key => "ssm_id"
	has_many :line_items
	
	def product_quantity(product)
      if @quantities.nil?
        @quantities = Array.new
        line_items.each do |item| 
          @quantities[item.product_id] = item.quantity
        end
      end
      @quantities[product]
	end
end
