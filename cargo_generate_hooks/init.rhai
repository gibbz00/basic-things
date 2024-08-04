let optional_prompt = "(leave empty if none)";

prompt_variable("codecov", `Optional Codecov token ${optional_prompt}`);
prompt_variable("architecture_url", `Optional architecture README.md URL ${optional_prompt}`);
prompt_variable("repository_path", "Repository path (usually 'username/repository_name')");

fn prompt_variable(name: &str, prompt: &str) {
	let value = variable::prompt(prompt);
	variable::set(name, value);
}

fn prompt_yes_no(name: &str, prompt: &str) {
	let value = switch variable::prompt(prompt, "No", ["Yes", "No"]) {
		"Yes" => true,
		"No" => false,
	};
	variable::set(name, value);
}
