# Project Guidelines

## General Principles

- Choose the simplest, cleanest approach that satisfies the requirement.
- Eliminate code repetition: extract shared logic into well-named functions,
  traits (Rust), or utility classes (Dart). Do not duplicate non-trivial logic
  across call sites.
- Prefer composition over inheritance.
- Name things clearly. Abbreviations are acceptable only when universally
  understood within the domain (`id`, `ctx`, `tx`, `rx`).
- Keep files focused on a single responsibility. A file should not exceed
  ~300 lines; split when it does.
- Write doc comments on every public API surface (Rust `///`, Dart `///`).
- Every commit message must be descriptive and reference the change intent.

---

## Flutter / Dart

### Architecture — Feature-Based Clean Architecture with BLoC

```
lib/
  app/
    app.dart                # MaterialApp / router setup
    router.dart             # route definitions
  core/
    constants/              # app-wide constants
    theme/                  # ThemeData, colors, typography
    utils/                  # pure utility functions
    error/                  # Failure classes, error handling
    network/                # HTTP client setup, interceptors
  features/
    <feature_name>/
      data/
        datasources/        # remote & local data sources
        models/             # DTOs, JSON serialisation
        repositories/       # repository implementations
      domain/
        entities/           # plain Dart classes (no deps)
        repositories/       # abstract repository contracts
        usecases/           # single-purpose use case classes
      presentation/
        bloc/               # BLoC, Event, State files
        pages/              # full-screen widgets
        widgets/            # feature-scoped reusable widgets
```

#### Layer rules

| Layer          | May depend on           | Must NOT depend on       |
| -------------- | ----------------------- | ------------------------ |
| `domain`       | nothing                 | `data`, `presentation`   |
| `data`         | `domain`                | `presentation`           |
| `presentation` | `domain` (via BLoC)     | `data` directly          |

### BLoC State Management

- One BLoC per feature concern. Name files `<feature>_bloc.dart`,
  `<feature>_event.dart`, `<feature>_state.dart`.
- Events are sealed classes (or a sealed base with subtypes). States are
  immutable and use `Equatable` or `freezed`.
- Keep BLoC logic pure: delegate IO to use cases injected via the constructor.
- Never import `flutter` packages inside `domain/` or `data/` layers.
- Provide BLoCs via `BlocProvider` at the nearest common ancestor in the
  widget tree. Do not provide globally unless the state is truly app-wide.
- Use `BlocBuilder` for widget rebuilds, `BlocListener` for side effects
  (navigation, snackbars), and `BlocConsumer` when both are needed.

### Idiomatic Flutter / Dart Practices

- **Immutability**: Prefer `final` fields and `const` constructors. Use
  `copyWith` for state transitions.
- **Null safety**: Embrace non-nullable types. Use nullable types only when
  absence is semantically meaningful, not as a default.
- **Extension methods**: Use to add behaviour to types you don't own (e.g.
  `DateTime`, `String`). Place in `core/utils/extensions/`.
- **Avoid `dynamic`**: Always specify types. Use generics instead of `dynamic`
  when the type varies.
- **Widget decomposition**: Extract widgets into named classes when a `build`
  method exceeds ~60 lines or when the widget is reused. Prefer stateless
  widgets; use stateful only when local ephemeral state (animation controllers,
  text controllers) is needed.
- **Const widgets**: Mark widgets and constructors `const` wherever possible
  to enable compile-time constant folding.
- **Formatting**: Run `dart format .` before every commit. Respect the
  project `analysis_options.yaml` without overriding rules.
- **Linting**: All code must pass `dart analyze` with zero warnings or errors.
  Fix the root cause; do not add `// ignore` unless justified in a comment.
- **Testing**: Unit-test use cases and BLoCs. Widget-test pages with
  `WidgetTester`. Place test files mirroring `lib/` structure under `test/`.
  Aim for meaningful coverage, not 100 % line coverage.
- **Dependency injection**: Use constructor injection. Register dependencies
  via `get_it` or equivalent service locator at app startup.
- **Barrel files**: Use `part` / `export` sparingly. A single barrel
  (`<feature>.dart`) per feature is acceptable; deeply nested barrels
  obscure the dependency graph.

---

## Cross-Cutting

- **FFI boundary** (Rust ↔ Flutter): Prefer JSON payloads over hand-rolled
  binary protocols. Use a code-generation layer (e.g. `ffigen`, `flutter_rust_bridge`)
  when feasible to reduce manual binding surface.
- **No dead code**: Remove unused imports, variables, functions, and files
  immediately. Do not comment out code for "later".
- **Performance**: Optimise only after profiling reveals a measurable problem.
  Prefer algorithmic improvements over micro-optimisations.

---

## Git & Commit Messages

### Commit Message Format

Use [Conventional Commits](https://www.conventionalcommits.org/) with the
following structure:

```
<type>(<scope>): <subject>

[optional body]

[optional footer(s)]
```

#### Type

| Type       | When to use                                          |
| ---------- | ---------------------------------------------------- |
| `feat`     | A new feature or user-visible behaviour              |
| `fix`      | A bug fix                                            |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf`     | A performance improvement                            |
| `test`     | Adding or updating tests only                        |
| `docs`     | Documentation-only changes                           |
| `style`    | Formatting, whitespace, semicolons — no logic change |
| `build`    | Changes to build system, dependencies, or CI config  |
| `chore`    | Maintenance tasks that don't modify src or test files |

#### Scope

Use a short, lowercase token identifying the affected area:

- Rust crates: `core`, `bridge`
- Flutter layers: `domain`, `data`, `presentation`, `bloc`, `ui`
- Cross-cutting: `ffi`, `ci`, `deps`

Omit the scope when a change genuinely spans the entire project.

#### Subject Line Rules

- **Imperative mood**: Write as a command — "add", "fix", "remove", not
  "added", "fixes", "removing".
- **Lowercase first word** after the colon; no trailing period.
- **≤ 72 characters** for the entire first line.
- **Be specific**: Describe *what* changed, not *that* something changed.
  - ✅ `fix(core): prevent division by zero in speed calculation`
  - ❌ `fix: bug fix`
  - ❌ `update code`

#### Body (optional)

- Separate from subject with a blank line.
- Wrap at 72 characters.
- Explain *why* the change was made when the subject alone is insufficient.
- Reference relevant context (issue numbers, design decisions).

#### Footer (optional)

- `BREAKING CHANGE: <description>` for any incompatible API change.
- `Refs: #<issue>` or `Closes: #<issue>` to link issues.

### Git Workflow Best Practices

- **One logical change per commit**: Each commit should be a single,
  self-contained unit of work that compiles and passes tests.
- **Squash before merging**: Consolidate fixup, WIP, and review-feedback
  commits into one clean commit per logical change.
- **Do not commit generated files**: Keep `Cargo.lock` for binaries but not
  libraries. Never commit `build/`, `.dart_tool/`, or `target/`.
- **Write meaningful branch names**: Use the pattern
  `<type>/<short-description>` (e.g. `feat/dashboard-speed-gauge`,
  `fix/ffi-null-pointer`).
- **Rebase over merge** for feature branches to maintain a linear history.
- **Never force-push shared branches** (`main`, `develop`).
- **Tag releases** with semantic versions: `v<major>.<minor>.<patch>`.
