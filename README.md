# Lavescape Mob 

>A small Flutter project showcasing Clean Architecture, SOLID principles, and BLoC/Cubit-based state management. The project focuses on maintainable, testable, and well-structured code rather than a polished, production UI.

---

## Project Overview

This repository demonstrates an architecture and coding style intended for professional mobile applications. The focus areas are:

- Clear separation of concerns using Clean Architecture (presentation, domain, data).
- SOLID design principles, especially Single Responsibility and Dependency Inversion.
- BLoC/Cubit-based state management for predictable and testable UI state.
- Reusable, well-typed widgets and modular animation handling.

- All user-facing strings are centralized in variables/constants to make future localization (e.g., Arabic or other languages) straightforward.

Note: The UI is partially implemented — the intent here is to showcase architecture, state handling, validation, and integration patterns rather than a finished product.

Mock APIs are used for signup and OTP verification. The default OTP for the mock backend is `123456`.

---

## Architecture (Clean Architecture)

The codebase is organized into three main layers:

- Presentation: UI, widgets, and state management (Cubits/BLoCs). Look under `lib/` — feature modules are grouped (e.g. `signup/`, `auth/`).
- Domain: Pure business logic — entities, repository interfaces, and use cases. Located under `lib/domain/`.
- Data: Implementations of repository interfaces, data sources (mock API clients), and models. Located under `lib/data/` and `lib/data/datasources/`.

Key folder mapping (high-level):

```
lib/
	├─ domain/
	│   ├─ repositories/      # abstract contracts
	│   └─ usecases/          # business use-cases
	├─ data/
	│   ├─ datasources/       # api clients, mock backends
	│   ├─ models/            # data models and mappers
	│   └─ repositories/      # concrete repository implementations
	├─ signup/                # feature module
	│   ├─ cubit/             # Cubit files and states
	│   └─ views/             # screens and widgets
	└─ widgets/               # global reusable widgets
```

This layout enforces dependency direction: presentation -> domain -> data. Domain never depends on data or presentation.

SOLID notes
- Single Responsibility: each class/file focuses on one purpose (e.g., a Cubit only manages signup state, a UseCase only performs one business action).
- Dependency Inversion: high-level modules (use cases) depend on abstractions (repository interfaces) declared in the domain layer; concrete implementations are provided in the data layer via dependency injection.

---

## State Management (BLoC + Cubit)

Each feature has a dedicated Cubit that encapsulates mutable state and exposes an immutable state stream to the UI. Typical folder: `lib/signup/cubit/`.

Patterns used:

- Emit-based transitions: Cubit emits explicit states (e.g., Loading, Success, Error) so views can react deterministically.
- Thread-safe: async operations use `async/await` inside Cubit methods; states are emitted after awaited results ensuring UI gets updates on the main/UI thread.
- Small, testable methods: actions (e.g., `submitSignup`, `verifyOtp`) are small and return Futures when needed to allow unit tests.

Example Cubit responsibilities:

- Validate inputs (email, phone, password, OTP) and expose validation errors.
- Call use-cases which delegate to repositories.
- Map repository responses to UI states.

---

## Navigation Management

Navigation in this project is handled with a focus on testability and strong typing:

- Route registry: All named routes (or route builders) are centralized in a single router file (e.g., `lib/app/routes.dart` or `lib/routes/`) so it's easy to find and update navigation flows.
- NavigationService / `GlobalKey<NavigatorState>`: A small navigation service exposes push/pop methods. This allows navigation to be called from non-widget layers (e.g., Cubits or services) while keeping the UI layer thin.
- Strongly-typed arguments: Where screens expect parameters, simple typed wrappers (or typed RouteSettings) are used so callers can't accidentally pass wrong data.
- Deep linking & guards: The router can be extended with middleware-like checks (auth guards) to redirect unauthenticated users to signin screens.

Example (conceptual):

```dart
// Simple NavigationService
class NavigationService {
	final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

	Future<void> pushNamed(String routeName, {Object? arguments}) async {
		return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
	}

	void pop([Object? result]) => navigatorKey.currentState?.pop(result);
}
```

Because navigation is centralized and accessible through a service, widget tests can inject a fake navigation service and assert navigation calls without pumping real routes.

---

## Thread Management & Async Safety

All network and long-running tasks are performed using asynchronous functions. Cubit methods use `async`/`await` and emit states only after awaited operations finish. This ensures:

- No blocking on the main thread.
- Predictable ordering of emits.
- Simple, testable control flow.

For more advanced scenarios (debounce, cancellable flows), a stream transformer or throttle can be introduced inside the Cubit or a separate service.

---

## Validation Handling (in Cubit)

Validation logic lives in the Cubit (or a small validator helper in `lib/utils/`). This keeps widgets purely declarative and focused on rendering.

Example (pseudo) validation snippet — email, password, OTP:

```dart
// inside SignupCubit
String? validateEmail(String email) {
	final emailRegex = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");
	if (email.trim().isEmpty) return 'Email is required';
	if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
	return null; // valid
}

String? validatePassword(String password) {
	if (password.length < 8) return 'Password must be at least 8 characters';
	return null;
}

String? validateOtp(String otp) {
	if (otp.length != 6) return 'OTP must be 6 digits';
	if (!RegExp(r'^\d{6}\$').hasMatch(otp)) return 'OTP must contain only digits';
	return null;
}
```

The Cubit runs these validators before calling use cases and emits a validation error state if any check fails.

---

## Animation Management

Animations are implemented with Flutter's animation APIs. The project favors:

- Implicit animations (AnimatedContainer, AnimatedOpacity) for simple transitions.
- Explicit controllers (AnimationController, Tween) wrapped in small reusable widgets for more complex motion.

Animations are extracted into components under `lib/widgets/animations/` to keep screen code focused on layout. Each animation widget is parameterized so it stays reusable and testable.

---

## Widget Refactoring & Reusability

Reusable widgets live in `lib/widgets/` or feature-level `widgets/` directories. Examples:

- `ui_button.dart` — customizable button supporting loading state.
- `ui_textfield.dart` — standardized text field with validation message slot.
- `otp_textfield.dart` — specialized OTP input component.

Components are small, composable, and receive callbacks only (no business logic). This makes unit and widget testing straightforward.

---

## Mock API Integration

This project uses a mock/fake backend for development and demonstration. The mock backend is a simple layer inside `lib/data/datasources/` or a local JSON file, and it returns predictable responses for signup and OTP verification.

Default mock behavior:

- Signup: Accepts name, email, phone and returns a temporary `signupSessionId`.
- OTP verification: Accepts `signupSessionId` and `otp`. The mock OTP is `123456`.

Sample endpoints (conceptual):

```
POST /mock/signup      -> { success: true, signupSessionId: "abc-123" }
POST /mock/verify-otp  -> { success: true } // requires otp === "123456"
```

How repositories handle this:

- The domain layer defines `AuthRepository` interface with `signup()` and `verifyOtp()`.
- The data layer contains `MockAuthRepository` that implements the interface. It calls the mock data source which returns the expected JSON.
- The Cubit calls a `SignupUseCase` which uses `AuthRepository` to perform the operations.

This arrangement keeps the domain layer isolated from any concrete networking or mocking details.

---

## How to Run the Project

Prerequisites

- Flutter SDK (recommended stable channel). This project was developed against Flutter 3.x / 4.x — use the latest stable release compatible with your environment.
- Android Studio / Xcode or a device/emulator for your platform.

Steps

```powershell
# Clone the repository
git clone https://github.com/MustafaAR1/Lavescape-Mob.git
cd Lavescape-Mob

# Get packages
flutter pub get

# Run on Windows / Android / iOS
flutter run
```

Notes

- If you need a specific Flutter version, use `flutter --version` and `fvm` to pin a version.
- Mock APIs are embedded — no external network setup is required.

---

## Future Work

Planned improvements:

- Complete the remaining UI screens and polish layouts.
- Add integration tests for Cubit -> UseCase -> Repository flows.
- Replace mock backend with a configurable real backend (with environment flags).
- Add more animations and accessibility improvements.

---

## Purpose for Interviewers 🎯

This repository is intentionally structured to demonstrate my architecture and engineering decisions:

- How I separate concerns and apply Clean Architecture.
- How I design and manage state with BLoC/Cubit to keep UI predictable and testable.
- How I follow SOLID principles and dependency inversion.

If you'd like, I can walk you through specific files such as `lib/signup/cubit/*`, `lib/domain/usecases/*`, or `lib/data/repositories/*` during an interview to explain design decisions and trade-offs.

---

Thank you for reviewing — if you want, I can also add a short walkthrough video or annotated diagram showing the dependency graph and control flow.
# lavescape_mob

