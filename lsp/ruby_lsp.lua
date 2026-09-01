-- Ruby tooling is Gemfile-pinned (rubocop ~> 1.88 + rails/capybara/performance
-- plugins), so the server must come from the bundle, not from Mason.
return {
  cmd = { "bundle", "exec", "ruby-lsp" },
}
