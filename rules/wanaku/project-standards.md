# Project Standards

This rule file contains build tools, commands, and code style constraints for the project. Commands read this file to determine how to build, test, and format code.

- **Build tool:** Maven
- **Build command:** `mvn verify`
- **Test command:** `mvn verify`
- **Test with coverage command:** `mvn verify -Pcoverage`
- **Format command:** `mvn verify` (auto-formats during build)
- **Module-specific build:** no (run from root)
- **Parallelized Maven:** yes
- **Code style restrictions:** none
