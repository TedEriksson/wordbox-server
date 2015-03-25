class AddSentenceToWords < ActiveRecord::Migration
  def change
    add_reference :words, :sentence, index: true
    add_foreign_key :words, :sentences
  end
end
