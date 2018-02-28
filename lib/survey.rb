class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {:presence => true, :length => { :maximum => 50 }})
  before_save(:capitalize_title)

private

  def capitalize_title
    self.title=title.split.map(&:capitalize).join(' ')
  end

end
