# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  if (a <= 0 || b <= 0 || c <= 0)
    raise TriangleError
  end

  if (a == b) && (b == c)
    return :equilateral
  end

  if (a == b) || (b == c) || (c == a)
    if is_isosceles_valid([a, b, c])
      raise TriangleError
    end
    :isosceles
  else
    :scalene
  end
end

def is_isosceles_valid(sides)
  equal_length_value = 0
  non_equal_length_value = 0

  sides.each_with_index.each do |item, index|
    if item == sides[((index + 1) - sides.length)] || item == sides[((index + 2) - sides.length)]
      equal_length_value = item
    else
      non_equal_length_value = item
    end
  end

  equal_length_value < non_equal_length_value
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
