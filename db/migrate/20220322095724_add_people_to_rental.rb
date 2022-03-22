class AddPeopleToRental < ActiveRecord::Migration[6.1]
  def change
    add_column :rentals, :number_of_people, :integer
  end
end
