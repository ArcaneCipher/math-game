# The Question class is responsible for generating math questions.
# Each question consists of two randomly generated numbers (1-20).
class Question
  attr_reader :num1, :num2

  # Initializes a new question by generating two random numbers between 1 and 20.
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  # Returns the math question as a formatted string.
  def ask_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  # Checks if the given answer is correct.
  # Converts the input to an integer and compares it to the correct sum.
  def correct_answer?(input)
    input.to_i == (@num1 + @num2)
  end
end
