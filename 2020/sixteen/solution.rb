# frozen_string_literal: true

input = File.readlines('input.txt', chomp: true)

def ticket_scan_error_rate(input)
  tickets = get_nearby_tickets(input)
  ranges = get_field_ranges(input)
  scan_error_rate = 0
  tickets.each do |ticket|
    scan_error_rate += invalid_values(ticket, ranges)
  end
  scan_error_rate
end

def get_nearby_tickets(input)
  nearby_tickets = input[input.find_index('nearby tickets:') + 1, input.length]
  nearby_tickets.map! { |s| s.split(',').map(&:to_i) }
end

def get_field_ranges(input)
  fields = input[0, input.find_index('your ticket:') - 1]
  fields.map! { |s| s.split(': ') }.map { |s| s.delete_at(0) }
  field_ranges = fields.map { |s| s.first.split(' or ') }.flatten
  field_ranges.map! { |s| s.split('-') }.map! { |r| Range.new(r[0].to_i, r[1].to_i) }
end

def invalid_values(ticket, ranges)
  sum_invalid_values = 0
  ticket.each do |value|
    sum_invalid_values += value if ranges.none? { |range| range.cover?(value.to_i) }
  end
  sum_invalid_values
end

puts "The ticket scan error rate is #{ticket_scan_error_rate(input)}."
