class Branch < ActiveRecord::Base
    has_many :plans
    validates_uniqueness_of :title
end
