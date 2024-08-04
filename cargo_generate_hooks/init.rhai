template_book();
prompt_optional_string("codecov", "Codecov token");
prompt_optional_string("architecture_url", "Architecture README.md URL");
prompt_variable("repository_path", "Repository path (usually 'username/repository_name')");

fn template_book() {
	let include_mdbook = prompt_yes_no("Create mdBook template");

	if !include_mdbook {
		file::delete("book.toml");
		file::delete("book");
	}

	if include_mdbook {
		prompt_optional_string("mdbook_pages_url", "Publish the mdBook to repository's static pages service? If so, to which URL?");
	}
}

fn prompt_variable(name, prompt) {
	let value = variable::prompt(prompt);
	variable::set(name, value);
}

fn prompt_optional_string(name, prompt) {
	prompt_variable(name, `${prompt} (leave empty if none)`);
}

fn prompt_yes_no(name, prompt) -> bool {
	let value = switch variable::prompt(prompt, "No", ["Yes", "No"]) {
		"Yes" => true,
		"No" => false,
	};
	variable::set(name, value);

	value
}
