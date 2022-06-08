#[warn(dead_code)]
use std::io::BufRead;

fn main() {
    let vec     = obtener_vector();
    let prom    = promedio(vec);
    clasifica(vec, prom);
}

fn promedio(vec: Vec<i32>) -> f32 {
    let suma: i32 = vec.iter().sum();
    let prom: f32 = (suma as f32)/(vec.len() as f32);
    return prom;
}

fn obtener_vector() -> Vec<i32> {
    let mut vec: Vec<i32> = Vec::new();
    let n: i32 = read_int();
    for _ in 0..n {
        vec.push(read_int());
    }
    return vec;
}

fn clasifica(vec: Vec<i32>, val: f32) {
    let mut parity;
    let mut comp;
    for v in vec { 
        parity  = if v & 1 == 0 {"par"} else {"non"};
        comp    = if (v as f32) > val {"mayor"} else {
            if (v as f32) < val {"menor"} else {"igual"}};
        println!("{} es {} y es {} que {}",
            v, parity, comp, val);

    }
}

fn read_int() -> i32 {
    let n: i32 = std::io::stdin()
        .lock().lines().next()
        .expect("stdin should be available")
        .expect("couldn't read from stdin")
        .trim().parse()
        .expect("input was not an integer");
    return n;
}
