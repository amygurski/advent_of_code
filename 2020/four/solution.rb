# frozen_string_literal: true

$/ = "\n\n"
# passports = File.read('input.txt')
passports = File.readlines('input.txt', chomp: true).map { |s| s.gsub(/[\n\s]/, ',') }
required_fields = %w[ecl pid eyr hcl byr iyr hgt]

def count_valid_passports(passports, required_fields)
  passports.each.count do |p|
    passport_hash = Hash[*p.split(/[:,]/)]
    required_fields.all? { |s| passport_hash.key? s }
  end
end

number_valid_passports = count_valid_passports(passports, required_fields)
puts "There are #{number_valid_passports} valid passports"
