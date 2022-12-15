class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :topic
      t.string :description
      t.string :choice_one
      t.integer :choice_one_votes
      t.string :choice_two
      t.integer :choice_two_votes
      t.string :choice_three
      t.integer :choice_three_votes

      t.timestamps
    end
  end
end
