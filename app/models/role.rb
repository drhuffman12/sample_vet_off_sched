class Role < ActiveRecord::Base
  validates_inclusion_of :name, :in => %w( admin recept dr cust )
end
