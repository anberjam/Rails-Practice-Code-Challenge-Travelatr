class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers
    
    def average_age
        sum = 0
        self.blogger.each do |blogger|
            sum += blogger.age
        end
        sum / self.blogger.count
    end
end
