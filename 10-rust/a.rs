mod common;

fn value_of_character(c : char) -> u64 {
	match c {
		')' => 3,
		']' => 57,
		'}' => 1197,
		'>' => 25137,
		_ => 1
 	}
}

fn main() -> Result<(), std::io::Error> {
	let filename = std::env::args().nth(1).unwrap_or(String::from("data"));

	let solution : u64 = 
		std::fs::read_to_string(&filename)?
			.split_whitespace()
			.map(|x| common::syntax(x, |_| ()))
			.flat_map(|e| e.err())
			.map(value_of_character)
			.sum();
	
	println!("{}: {}", filename, solution);
	Ok(())
}
