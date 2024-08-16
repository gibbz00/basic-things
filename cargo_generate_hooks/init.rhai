template_book();
prompt_optional_string("codecov", "Codecov token");
prompt_optional_string("architecture_url", "Architecture README.md URL");
prompt_variable("repository_path", "Repository path (usually 'username/repository_name')");

fn template_book() {
	let include_mdbook = prompt_yes_no("include_mdbook", "Create mdBook template");

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
	let optional_value = variable::prompt(name, `${prompt} (enter one space character if none)`);

	if optional_value != " " {
		variable::set(name, optional_value);
	}
}

fn prompt_yes_no(name, prompt) {
	let value = switch variable::prompt(prompt, "No", ["Yes", "No"]) {
		"Yes" => true,
		"No" => false,
	};
	variable::set(name, value);

	value
}
