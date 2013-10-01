class CreateNewsletterSignUps < ActiveRecord::Migration
  def change
    create_table :newsletter_sign_ups do |t|
      t.string :email
      t.string :category
      t.text :notes

      t.timestamps
    end
  end
end
