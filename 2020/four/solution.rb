# frozen_string_literal: true

$/ = "\n\n"
passports = File.readlines('input.txt', chomp: true).map { |s| s.gsub(/[\n\s]/, ',') }
required_fields = %w[ecl pid eyr hcl byr iyr hgt]

# Returns the array of passports that have all of the
# required fields (aka present)
def get_present_passports(passports, required_fields)
  present_passports = []
  passports.each do |p|
    passport_hash = Hash[*p.split(/[:,]/)]
    present_passports << passport_hash if required_fields.all? { |s| passport_hash.key? s }
  end
  present_passports
end

# Returns the number of valid passports
def get_valid_passports(present_passports)
  present_passports.each.count do |p|
    p['byr'].to_i >= 1920 && p['byr'].to_i <= 2002 &&
      p['iyr'].to_i >= 2010 && p['iyr'].to_i <= 2020 &&
      p['eyr'].to_i >= 2020 && p['eyr'].to_i <= 2030 &&
      valid_height(p['hgt']) &&
      p['hcl'].match(/^#[a-f0-9]{6}/) &&
      valid_eye_color(p['ecl']) &&
      p['pid'].length == 9 && p['pid'].match(/^[0-9]+$/)
  end
end

def valid_height(height)
  return false unless height.end_with?('cm', 'in')

  units = height[-2..-1] if height.end_with?('cm', 'in')

  return (height.to_i >= 150 && height.to_i <= 193) if units == 'cm'

  height.to_i >= 59 && height.to_i <= 76
end

def valid_eye_color(eye_color)
  valid_eye_colors ||= %w[amb blu brn gry grn hzl oth]
  valid_eye_colors.include?(eye_color)
end

present_passports = get_present_passports(passports, required_fields)
puts "There are #{present_passports.size} present passports"

count_valid_passports = get_valid_passports(present_passports)
puts "There are #{count_valid_passports} both present and valid passports"
