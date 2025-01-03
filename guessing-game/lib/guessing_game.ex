defmodule GuessingGame do
  def compare(secret_number, guess) when guess == secret_number do
    "Correct"
  end

  def compare(secret_number, :no_guess) do
    "Make a guess"
  end

  def compare(secret_number, guess) when (guess == secret_number - 1)  do
    "So close"
  end

  def compare(secret_number, guess) when (guess == secret_number + 1)  do
    "So close"
  end

  def compare(secret_number, guess) when (guess > secret_number + 1) do
    "Too high"
  end

  def compare(secret_number, guess) when guess < secret_number - 1 do
    "Too low"
  end

  def compare(secret_number) do
    "Make a guess"
  end
end
