class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :excerpt
      t.text :answer

      t.timestamps
    end
  end
end
