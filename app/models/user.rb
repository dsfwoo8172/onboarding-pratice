class User < ApplicationRecord
  GENDER = %w[male female others]
  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: GENDER,
                                  message: "Please fill one of options in. EX: #{GENDER}.join(' ')" }
  validates :age, numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0}
end
