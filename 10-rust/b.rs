mod common;

fn main() -> Result<(), std::io::Error> {
	let filename = std::env::args().nth(1).unwrap_or(String::from("data"));

	let file =std::fs::read_to_string(&filename)?; 
	let mut solution : Vec<_> = file
			.split_whitespace()
			.map(|x| common::syntax(x, |stack| stack.into_iter().rev().collect()))
			.flat_map(|o| o.ok())
			.map(|x : String| x.chars().fold(0, |total, c| total * 5 + " )]}>".find(c).unwrap()))
			.collect();

	solution.sort();
	println!("{}: {}", filename, solution[solution.len()/2]);
	Ok(())
}
