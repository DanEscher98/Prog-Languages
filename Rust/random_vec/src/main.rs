use dialoguer::Input;

fn main() {
    let name: String = Input::new()
        .with_prompt("Your name")
        .interact()
        .unwrap();
    let num = read_float();
    println!("{} says the number {}", name, num);
}

fn read_float() -> f32 {
    loop {
        print!("Enter a float number: ");
        let input: String = Input::new()
            .with_prompt("Set a float number")
            .interact()
            .unwrap();
        match input.trim().parse() {
            Ok(num) => { return num; }
            Err(err) => { println!("Error: {}", err); }
        }
    }
}
