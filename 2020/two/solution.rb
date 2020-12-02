# frozen_string_literal: true

password_list = File.readlines('input.txt')
password_list.map! { |line| line.chomp.split(': ') }
password_list.each_slice(2).to_a

valid_password_count = 0

password_list.each do |policy, pw|
  number_of_times = policy.split(' ').first
  range = Range.new(*number_of_times.split('-').map(&:to_i))
  letter = policy[-1]

  valid_password_count += 1 if range.include?(pw.count(letter))
end

puts "#{valid_password_count} passwords are valid"
