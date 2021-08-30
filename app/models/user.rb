# frozen_string_literal: true

class User

  include Mongoid::Document

  GENDER = %w[male female others]

  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :age, type: Integer

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: GENDER,
                                  message: "Please fill one of options in. EX: #{GENDER}.join(' ')" }
  validates :age, numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0}

  def full_name
    # first_name + " " + last_name
    # "#{first_name} #{last_name}"
    [first_name, last_name].join(' ')
  end
end
