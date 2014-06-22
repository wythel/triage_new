class Plan < ActiveRecord::Base
    has_many :reports
    belongs_to :branch
end
