#[warn(dead_code)]
use std::io;

fn main() {
    let x       = read_f32();
    println!("{}", func(x));
}

fn func(x: f32) -> f32 {
    return x.sin();
}

fn read_f32() -> f32 {
    let num:f32;
    let mut input = String::new();
    
    print!("Enter float: ");
    //io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut input)
        .expect("Not a valid string");
    num = input
        .trim()
        .parse()
        .expect("Not a valid number");
    return num;
}
