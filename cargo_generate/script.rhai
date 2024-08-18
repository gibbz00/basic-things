// WORKAROUND:
// CI will otherwise fail with a `Runtime error: IO error: not a terminal`,
// even when returning early for predefined values.
if variable::is_set("ci") {
	exit();
}

prompt_variable("repository_path", "Repository path (usually 'username/repository_name')");
template_license();
template_code_of_conduct();
template_security_policy();
template_precommit_hooks();
template_book();
prompt_optional_string("architecture_url", "Architecture README.md URL");
template_code_coverage();

fn template_license() {
	variable::set("year", system::date().year.to_string());

	let licenses = [
		"None",
		"Apache v2.0",
		"BSD 3-clause",
		"BSD 2-clause",
		"AGPLv3",
		"GPLv2",
		"GPLv3",
		"LGPLv3",
		"MIT",
		"MPL v2.0",
		"Unlicense",
	];

	let name = "license";
	if !variable::is_set(name) {
		let license = variable::prompt("Choose a license (LICENSE.md)", "None", licenses);
		variable::set(name, license);
	}

	let license_file_name = switch variable::get(name) {
		"None" => { return; },
		"Apache v2.0" => "APACHE-2",
		"BSD 3-clause" => "BSD-2",
		"BSD 2-clause" => "BSD-3",
		"AGPLv3" => "GNU-AGPL-3",
		"GPLv2" => "GNU-GPL-2",
		"GPLv3" => "GNU-GPL-3",
		"LGPLv3" => "GNU-LGPL-3",
		"MIT" => "MIT",
		"MPL v2.0" => "MPL-2",
		"Unlicense" => "UNLICENCE",
	};

	file::rename(`cargo_generate/licenses/${license_file_name}.md`, "LICENSE.md")
}

fn template_code_of_conduct() {
	let include_code_of_conduct = prompt_yes_no("include_code_of_conduct", "Template a code of conduct (CODE_OF_CONDUCT.md)");

	if !include_code_of_conduct {
		file::delete("CODE_OF_CONDUCT.md");
	}
}

fn template_security_policy() {
	let include_security_policy = prompt_yes_no("include_security_policy", "Template a security policy (SECURITY.md)");

	if !include_security_policy {
		file::delete("SECURITY.md");
	}
}

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

fn template_precommit_hooks() {
	let include_precommit = prompt_yes_no("include_precommit", "Create pre-commit hooks template");

	if !include_precommit {
		file::delete(".pre-commit-config.yaml");
	}
}

fn template_code_coverage() {
	let include_codecov = prompt_yes_no("include_codecov", "Upload code coverage to Codecov");

	if !include_codecov {
		file::delete(".github/codecov.yaml");
	}

	if include_codecov {
		let repository_path = variable::get("repository_path");
		print("Public Codecov graph token may be found at:");
		print(`https://app.codecov.io/gh/${repository_path}/config/badge`);
		print("");
		print("Include a Covecov badge in README.md?");
		prompt_optional_string("codecov_graph_token", "Graph token");
	}
}

fn prompt_variable(name, prompt) {
	if variable::is_set(name) {
		return;
	}

	let value = variable::prompt(prompt);
	variable::set(name, value);
}

fn prompt_optional_string(name, prompt) {
	if variable::is_set(name) {
		return;
	}

	let optional_value = variable::prompt(`${prompt} (leave empty if none)`, "");

	if optional_value != "" {
		variable::set(name, optional_value);
	}
}

fn prompt_yes_no(name, prompt) {
	if variable::is_set(name) {
		return variable::get(name);
	}

	let value = switch variable::prompt(prompt, "No", ["Yes", "No"]) {
		"Yes" => true,
		"No" => false,
	};
	variable::set(name, value);

	value
}
