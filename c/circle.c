#include "math.h"
#include "stdio.h"
#include "circle.h"

static double get_area(struct Circle *this)
{
  return M_PI * this->radius * this->radius;
}

static double get_perimeter(struct Circle *this)
{
  return 2 * M_PI * this->radius;
}

static struct Circle new(double radius)
{
  return (struct Circle){
    .radius = radius,
    .get_area = &get_area,
    .get_perimeter = &get_perimeter
  };
};

const struct CircleClass Circle={.new=&new};

int main()
{
  struct Circle circle = Circle.new(11);
  struct Circle circle1 = Circle.new(4.44);
  
  printf("%g\n", circle.get_area(&circle));
  printf("%g\n", circle.get_perimeter(&circle));
  
  printf("%g\n", circle1.get_area(&circle1));
  printf("%g\n", circle1.get_perimeter(&circle1));
}
