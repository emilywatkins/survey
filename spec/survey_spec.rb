require("spec_helper")

describe(Survey) do

  it("converts the title to titlecase") do
    survey = Survey.create({:title => "FINAGLE THE BUFFALO"})
    expect(survey.title).to(eq("Finagle The Buffalo"))
  end

    it("returns an array of questions for that survey") do
      survey = Survey.create({:title => "Epicodus stuff"})
      question = Question.create({:question => "White or black?", :survey_id => survey.id})
      question2 = Question.create({:question => "Red or green?", :survey_id => survey.id})
      expect(survey.questions).to(eq([question, question2]))
  end

end
