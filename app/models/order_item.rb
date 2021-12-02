class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :course
    before_save :set_cost
    before_save :set_total
    def cost
        if persisted?
            self[:cost]
        else
            course.cost
        end
    end

    def total
        cost*1
    end
    private
    def set_cost
        self[:cost] = cost
    end
    def set_total
        self[:total] = total*1
    end
end
