prompt_optional_string("codecov", "Codecov token");
prompt_optional_string("architecture_url", "Architecture README.md URL");
prompt_variable("repository_path", "Repository path (usually 'username/repository_name')");

fn prompt_variable(name: &str, prompt: &str) {
	let value = variable::prompt(prompt);
	variable::set(name, value);
}

fn prompt_optional_string(name: &str, prompt: &str) {
	prompt_variable(name, `${prompt} (leave empty if none)`);
}

fn prompt_yes_no(name: &str, prompt: &str) {
	let value = switch variable::prompt(prompt, "No", ["Yes", "No"]) {
		"Yes" => true,
		"No" => false,
	};
	variable::set(name, value);
}
