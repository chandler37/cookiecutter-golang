# {{cookiecutter.component_id}}

{{cookiecutter.project_short_description}}

## Getting started

This project requires Go 1.22 or newer to be installed. You can download it from [https://golang.org/dl/](https://golang.org/dl/) or use your system's package manager (e.g., `brew install go` on OS X with Homebrew).

To build and run the application:

```console
# Build the application
$ make build

# Run the compiled binary
$ ./bin/{{cookiecutter.component_id}}
```

Alternatively, you can run it directly using `go run`:
```console
$ go run ./main.go  # Assuming main.go is the entry point
```

### Testing

To run the tests (including race detection):

```console
$ make test
```

This project uses Go Modules for dependency management. Dependencies are automatically downloaded when building or testing.
CI/CD pipelines are configured for GitHub Actions, CircleCI, and Travis CI, ensuring automated builds and tests against Go 1.22.
