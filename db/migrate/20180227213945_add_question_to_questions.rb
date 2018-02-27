class AddQuestionToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column(:questions, :question, :string)
  end
end
