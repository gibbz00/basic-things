let optional_prompt = "(leave empty if none)"

prompt_variable("codecov", `Optional Codecov token ${optional_prompt}`);
prompt_variable("architecture_url", `Optional architecture README.md URL ${optional_prompt}`);

fn prompt_variable(name: &str, prompt: &str) {
	let value = variable::prompt(`Optional architecture README.md URL ${optional_prompt}`);
	variable::set("architecture_url", value);
}
