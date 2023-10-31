const SWITCH_BETWEEN_PENSILS : i32 = 1;
const COLOR_SQUARE : i32 = 2;

fn color_pattern_times(colors: &[&str]) -> i32 {
    let mut previous_color = "";
    let mut time = 0;

    for color in colors {
        time = time + COLOR_SQUARE;
        if previous_color != *color && previous_color != "" {
            time = time + SWITCH_BETWEEN_PENSILS;
        }
        previous_color = color;
    }

    return time;
}

fn main() {
    println!("Hello, world");

    println!("{}", color_pattern_times(&["blue"]));
    println!("{}", color_pattern_times(&["red", "yallow", "green", "blue"]));
    println!("{}", color_pattern_times(&["blue", "blue", "blue", "red", "red", "red"]));
}
