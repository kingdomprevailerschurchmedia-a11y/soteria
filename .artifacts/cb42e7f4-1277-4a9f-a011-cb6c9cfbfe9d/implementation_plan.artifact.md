# Global Deep Linking Infrastructure

Build a production-ready, scalable infrastructure for handling deep links, universal links, and application routing in Soteria.

## User Review Required

- **Routing Strategy:** Integration of deep link handling within `GoRouter` using redirected routes and authentication guards.
- **Security:** Infrastructure to validate deep links before processing, preventing unauthorized access or navigation.

## Proposed Changes

### [core/navigation]

#### [NEW] [deep_link_service.dart](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/core/navigation/deep_link_service.dart)
- Manages the lifecycle of deep links, queueing pending navigation intents until the app is ready.

#### [MODIFY] [app_router.dart](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/core/navigation/app_router.dart)
- Update `GoRouter` configuration to support deep link-driven navigation.
- Add `redirect` logic to handle incoming link intents.

### [core/navigation/application]

#### [NEW] [deep_link_controller.dart](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/core/navigation/application/deep_link_controller.dart)
- Riverpod state management for pending deep links and navigation queue.

## Verification Plan

### Automated Tests
- Parser tests: Validate that all supported URL formats (tournament, wallet, etc.) are correctly parsed.
- Routing tests: Mock deep link arrival during app initialization (cold start) and while the app is running (warm start).

### Manual Verification
- Test navigation by manually triggering deep links (e.g., using `flutter deep-link` commands if available or internal testing tools).
- Verify auth redirects (e.g., login screen -> deep link target).
