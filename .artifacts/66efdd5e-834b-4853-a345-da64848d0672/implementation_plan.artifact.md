# Epic 3 Production Readiness & Stabilization

This plan outlines the steps to perform a comprehensive production readiness audit and stabilization of the Epic 3 implementation in the Soteria application.

## User Review Required

The audit revealed a significant number of analyzer errors related to missing design system imports and broken state management generated code (`freezed`). I plan to address these first as they are blocking any further verification.

## Open Questions

None at this time.

## Proposed Changes

### [Infrastructure Stabilization]

#### [FIX] [Import paths across `lib/core` and `lib/features`](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/core)
- Fix broken import references to `design_system.dart`.
- Re-run `build_runner` to resolve `freezed` generated code errors (missing implementations of abstract classes).
- Fix undefined design system constants (`SoteriaColors`, `SoteriaSpacing`, `SoteriaTypography`, `SoteriaRadius`).

#### [FIX] [Remove Light Theme dependencies](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/features/developer_preview/presentation/widgets/preview_wrapper.dart)
- Remove reference to `SoteriaTheme.light` to strictly enforce Dark Theme Only policy.

### [Code Quality & Cleanup]

#### [FIX] [Refactorings and Cleanup](file:///C:/Users/kpc-m/AndroidStudioProjects/PROJECT/SOTERIA/lib/core)
- Resolve `unused_import` warnings.
- Address `unnecessary_lambdas`.
- Replace remaining `print()` statements with the project's logging service.

### [Architecture & Testing]

#### [VERIFY] [Architecture Compliance]
- Verify compliance with Clean Architecture and Riverpod best practices.

#### [NEW/UPDATE] [Tests]
- Generate missing unit and widget tests for core components.

## Verification Plan

### Automated Tests
- `flutter analyze` must pass with zero issues.
- `flutter test` must pass all tests.

### Manual Verification
- Verify the Application Shell, Navigation, Search, Notification Center, and Overlay Framework rendering in the Developer Preview Gallery (all in Dark Theme).
- Responsive layout checks on different device configurations.
- Accessibility audit using screen readers.
- Deep linking validation.

## Technical Debt Tracker
- [ ] Fix broken imports (analyzer errors).
- [ ] Regenerate generated code (`freezed`).
- [ ] Remove light theme references.
- [ ] Audit state management (Riverpod).
- [ ] Audit navigation (GoRouter).
- [ ] Run comprehensive test suite.
- [ ] Produce final production readiness report.
