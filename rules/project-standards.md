# Project Standards

This rule file contains build tools, commands, and code style constraints for each project. Commands read this file to determine how to build, test, and format code.

## Wanaku

- **Build tool:** Maven
- **Build command:** `mvn verify`
- **Test command:** `mvn verify`
- **Format command:** `mvn verify` (auto-formats during build)
- **Module-specific build:** no (run from root)
- **Parallelized Maven:** yes
- **Code style restrictions:** none

## Wanaku Capabilities Java SDK

- **Build tool:** Maven
- **Build command:** `mvn verify`
- **Test command:** `mvn verify`
- **Format command:** `mvn verify` (auto-formats during build)
- **Module-specific build:** no (run from root)
- **Parallelized Maven:** yes
- **Code style restrictions:** none

## Camel Integration Capability

- **Build tool:** Maven
- **Build command:** `mvn verify`
- **Test command:** `mvn verify`
- **Format command:** `mvn verify` (auto-formats during build)
- **Module-specific build:** no (run from root)
- **Parallelized Maven:** yes
- **Code style restrictions:** none

## Apache Camel (camel-core)

- **Build tool:** Maven
- **Build command:** `mvn verify`
- **Test command:** `mvn verify`
- **Format command:** `cd <module> && mvn -DskipTests install`
- **Module-specific build:** yes (always run `mvn` in the module directory where changes occurred)
- **Parallelized Maven:** no (resource intensive, do NOT parallelize Maven jobs)
- **Code style restrictions:**
  - Do NOT use Records or Lombok (unless already present in the file)
  - Do NOT change public API signatures without justification
  - Do NOT add new dependencies without justification
  - Maintain backwards compatibility for public APIs

## AI Agents OSS Helper

- **Build tool:** none (Markdown/shell scripts only)
- **Build command:** _(none)_
- **Test command:** _(none)_
- **Format command:** _(none)_
- **Module-specific build:** no
- **Parallelized Maven:** n/a
- **Code style restrictions:** none
