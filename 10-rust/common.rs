fn close(opens : char) -> Result<char, char> {
	return match opens {
		'(' => Ok(')'),
		'[' => Ok(']'),
		'<' => Ok('>'),
		'{' => Ok('}'),
		_ => Err(opens)
	}
}

pub fn syntax<F, T>(code : &str, cont: F) -> Result<T, char>
	where F : FnOnce(Vec<char>) -> T {
	let mut stack : Vec<char> = vec![];
	for chr in code.chars() {
		if ")]>}".contains(chr) {
			if let Some(expected) = stack.pop() {
				if chr == expected {
					continue
				}
			}
			return Err(chr)
		}
		stack.push(close(chr)?);
	}
	
	Ok(cont(stack))
}

