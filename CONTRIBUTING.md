# Contributing to willswire's Homebrew Tap

Thank you for your interest in contributing to this Homebrew tap! Here are some guidelines to help you get started.

## Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-formula`)
3. Add or update your formula
4. Commit your changes (`git commit -am 'Add some amazing formula'`)
5. Push to the branch (`git push origin feature/amazing-formula`)
6. Create a new Pull Request

## Adding a New Formula

1. Create a new Ruby file in the `Formula` directory
2. Follow the Homebrew formula syntax and guidelines
3. Make sure to include the following:
   - Description
   - Homepage
   - URL and SHA256 checksum
   - License information
   - Installation instructions
   - Test block

## Testing

Before submitting a PR, please test your formula:

```bash
brew install --build-from-source ./Formula/your_formula.rb
brew test ./Formula/your_formula.rb
```

## Style Guidelines

Follow the Homebrew style guidelines:
- Use two spaces for indentation
- Follow Ruby style conventions
- Keep formulas simple and focused