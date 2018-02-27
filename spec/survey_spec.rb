require("spec_helper")

describe(Survey) do

  it("converts the title to titlecase") do
    survey = Survey.create({:title => "FINAGLE THE BUFFALO"})
    expect(survey.title).to(eq("Finagle The Buffalo"))
  end

end
