# frozen_string_literal: true

password_list = File.readlines('input.txt')
password_list.map! { |line| line.chomp.split(': ') }
password_list.each_slice(2).to_a

# Returns the number of valid passwords.
# A password is valid if the given letter appears within
# the number of times specified by the policy.
def old_policy(password_list)
  valid_password_count = 0
  
  password_list.each do |policy, pw|
    letter = policy[-1]

    number_of_times = policy.split(' ').first
    range = Range.new(*number_of_times.split('-').map(&:to_i))
  
    valid_password_count += 1 if range.include?(pw.count(letter))
  end

  puts "#{valid_password_count} passwords are valid"
end

# Returns the number of valid passwords.
# A password is valid if the given letter appears in the first or
# last position provided but not both.
def new_policy(password_list)
  valid_password_count = 0
  
  password_list.each do |policy, pw|
    letter = policy[-1]

    positions = policy.split(' ').first
    positions = positions.split('-').map(&:to_i)
    indeces = positions.map {|x| x - 1}
    
    valid_password_count += 1 if indeces.one? {|i| pw[i] == letter}
  end

  puts "#{valid_password_count} passwords are valid"
end

old_policy(password_list)
new_policy(password_list)

