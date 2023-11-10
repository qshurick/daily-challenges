struct Circle
{
    double radius;
    double (*get_area)(struct Circle *this);
    double (*get_perimeter)(struct Circle *this);
};

extern const struct CircleClass
{
    struct Circle (*new)(double radius);
} Circle;
