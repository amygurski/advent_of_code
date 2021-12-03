$position = 0
$depth = 0
$depth2 = 0

def forward(n)
  $position += n
  $depth2 += $depth * n
end

def down(n)
  $depth += n
end
  
def up(n) 
  $depth -= n
end

eval ARGF.read

puts $position * $depth
puts $position * $depth2