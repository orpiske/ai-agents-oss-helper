# Project Standards

This rule file contains build tools, commands, and code style constraints for the project. Commands read this file to determine how to build, test, and format code.

- **Build tool:** Go (make)
- **Build command:** `make build`
- **Test command:** `make test`
- **Format command:** `gofmt -w .`
- **Module-specific build:** no (run from root)
- **Parallelized Maven:** n/a
- **Code style restrictions:**
  - Follow standard Go conventions (gofmt, go vet)
